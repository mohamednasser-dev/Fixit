<?php

namespace App\Http\Controllers;

use App\Visitor;
use App\Order;
use App\Participant;
use App\specialty;
use App\User_specialty;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use JD\Cloudder\Facades\Cloudder;
use Illuminate\Http\Request;
use App\Helpers\APIHelpers;
use App\WalletTransaction;
use App\UserNotification;
use App\Balance_package;
use App\Notification;
use App\ProductImage;
use App\Category;
use App\Favorite;
use App\Setting;
use App\Product;
use App\User;

class TechnicianController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login', 'select_my_data', 'update_profile', 'my_orders', 'change_status', 'change_order_status']]);
    }

    protected function respondWithToken($token)
    {
        return [
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 432000
        ];
    }

    public function login(Request $request)
    {
        $credentials = request(['phone', 'password']);
        $input = $request->all();
        $validator = Validator::make($input, [
            'phone' => 'required|exists:products,phone',
            'password' => 'required',
            'fcm_token' => 'required',
            'type' => 'required',
            'unique_id' => 'required',
        ]);
        if ($validator->fails()) {
            $response = APIHelpers::createApiResponse(true, 406, $validator->messages()->first(), $validator->messages()->first(), $validator->messages()->first(), $request->lang);
            return response()->json($response, 406);
        } else {
            if (!$token = auth::guard('tech')->attempt($credentials)) {
                $response = APIHelpers::createApiResponse(true, 401, 'Invalid phone or password', 'يرجي التاكد من رقم الهاتف او كلمة المرور', null, $request->lang);
                return response()->json($response, 401);
            }

            $user = auth::guard('tech')->user();
            $token = auth::guard('tech')->login($user);
            $user->token = $this->respondWithToken($token);
            $response = APIHelpers::createApiResponse(false, 200, '', '', $user, $request->lang);
            return response()->json($response, 200);

        }
    }

    public function select_my_data(Request $request)
    {
        $user = auth::guard('tech')->user();
        $lang = $request->lang;
        $data = Product::where('id', $user->id)
            ->select('id', 'title_ar', 'title_en', 'description_ar', 'description_en', 'email', 'main_image', 'phone', 'price')
            ->first()->makeHidden(['Product_categories', 'Orders_accepted']);
        $response = APIHelpers::createApiResponse(false, 200, '', '', $data, $lang);
        return response()->json($response, 200);
    }

    public function change_order_status(Request $request, $order_id, $status)
    {
        $user = auth::guard('tech')->user();
        $lang = $request->lang;
        $data = Order::where('product_id', $user->id)->where('id', $order_id)->first();
        if ($data) {
            Order::where('product_id', $user->id)->where('id', $order_id)->update(['status' => $status]);
        }
        $visitor = Visitor::where('unique_id', $request->header('uniqueid'))->pluck('fcm_token')->toArray();
        $title = 'Order status';
        if ($status == 'accept') {
            $body = 'Order accepted';
            $notifications = APIHelpers::send_notification($title , $body , '' , null , $visitor);
        }else {
            $body = 'Order rejected';
            $notifications = APIHelpers::send_notification($title , $body , '' , null , $visitor);
        }

        if ($notifications) {
            $thisVisitor = $visitor = Visitor::where('unique_id', $request->header('uniqueid'))->select('id')->first();
            $notification = new Notification();
            $notification->title = $title;
            $notification->body = $body;
            $notification->save();
            $user_notification = new UserNotification();
            $user_notification->user_id = $user->id;
            $user_notification->notification_id = $notification->id;
            $user_notification->visitor_id = $thisVisitor->id;
            $user_notification->save();
        }
        $response = APIHelpers::createApiResponse(false, 200, 'order status changes successfully', 'تم تغير حالة الطلب بنجاح', null, $lang);
        return response()->json($response, 200);
    }

    public function update_profile(Request $request)
    {
        $lang = $request->lang;
        Session::put('api_lang', $lang);
        $currentuser = auth::guard('tech')->user();
        $input = $request->all();
        if ($request->phone) {
            $validator = Validator::make($request->all(), [
                "phone" => 'unique:products,phone,' . $currentuser->id,
            ]);
        }
        if ($request->email) {
            $validator = Validator::make($request->all(), [
                "email" => 'unique:products,email,' . $currentuser->id,
            ]);
        }
        if ($request->description_ar || $request->description_en || $request->title_ar || $request->title_en ) {
            $validator = Validator::make($request->all(), [
                "title_en" => '',
                "title_ar" => '',
                "description_ar" => '',
                "description_en" => '',
            ]);
        }
        if ($validator->fails()) {
            $response = APIHelpers::createApiResponse(true, 406, $validator->errors()->first(), $validator->errors()->first(), null, $request->lang);
            return response()->json($response, 406);
        }

        if ($request->main_image != null) {
            $image = $request->main_image;
            Cloudder::upload("data:image/jpeg;base64," . $image, null);
            $imagereturned = Cloudder::getResult();
            $image_id = $imagereturned['public_id'];
            $image_format = $imagereturned['format'];
            $image_new_name = $image_id . '.' . $image_format;
            $input['main_image'] = $image_new_name;
        }
        if($request->phone){
            $input['phone'] = $request->phone;
        }
        if($request->email){
            $input['email'] = $request->email;
        }
        if($request->description_ar){
            $input['description_ar'] = $request->description_ar;
        }
        if($request->description_en){
            $input['description_en'] = $request->description_en;
        }
        if($request->title_ar){
            $input['title_ar'] = $request->title_ar;
        }
        if($request->title_en){
            $input['title_en'] = $request->title_en;
        }
        Product::where('id', $currentuser->id)->update($input);
        $newuser = Product::find($currentuser->id);
        $response = APIHelpers::createApiResponse(false, 200, '', '', $newuser, $request->lang);
        return response()->json($response, 200);
    }

    public function my_orders(Request $request)
    {
        $lang = $request->lang;
        Session::put('api_lang', $lang);
        $user = auth::guard('tech')->user();
        if (!$user) {
            $response = APIHelpers::createApiResponse(true, 406, 'you should login first', 'يجب تسجيل الدخول اولا', (object)[], $request->lang);
            return response()->json($response, 406);
        }
        $order = Order::with(['Address'])->select('id', 'product_id', 'status', 'visit_date', 'visit_time', 'address_id')
            ->with('Product')->where('product_id', $user->id)->get()->makeHidden(['Product_categories']);

        $response = APIHelpers::createApiResponse(false, 200, '', '', $order, $request->lang);
        return response()->json($response, 200);
    }

}
