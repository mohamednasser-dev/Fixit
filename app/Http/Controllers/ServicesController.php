<?php

namespace App\Http\Controllers;

use App\Category;
use App\Product;
use App\Product_category;
use App\Rate;
use App\Setting;
use App\SubCategory;
use App\User;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Request;
use App\Helpers\APIHelpers;
use function foo\func;

class ServicesController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api' , ['except' => [ 'details','technician_details','make_rate']]);
    }

    public function details(Request $request , $id , $cat_id){
        $lang = $request->lang ;
        Session::put('api_lang', $lang);
        
        
        $prod_cat = [];
        $data['service_categories'] = SubCategory::where('category_id',$id)->select('id','title_'.$lang.' as title')
            ->orderBy('sort', 'asc')->get()->toArray();
        for ($i = 0; $i < count($data['service_categories']); $i++) {
            if($cat_id == $data['service_categories'][$i]['id']){
                $data['service_categories'][$i]['selected'] = true ;
            }else{
                $data['service_categories'][$i]['selected'] = false ;
            }
        }
        $title = 'All';
        if ($lang == 'ar') {
            $title = 'الكل';
        }
        $all = new \StdClass;
        $all->id = 0;
        $all->title = $title;
        if($cat_id == 0){
            $all->selected = true;
        }else{
            $all->selected = false;
        }
        array_unshift($data['service_categories'], $all);
        if($cat_id == 0){
            $data['technicians'] = Product::where('category_id',$id)
                ->select('id','title_'.$lang.' as title','main_image as image','category_id')
                ->get()->makeHidden(['Product_categories','Orders_accepted']);
        }else{
            $technicians_data = Product_category::
            with('Product')->with('Category_data')
            ->where('cat_id',$cat_id)->get();
            foreach ($technicians_data as $key => $row){
                $prod_cat[$key]['id'] = $row->product_id ;
                if($lang == 'ar'){
                    $prod_cat[$key]['title'] = $row->Product->title_ar ;
                }else{
                    $prod_cat[$key]['title'] = $row->Product->title_en ;
                }

                $prod_cat[$key]['image'] = $row->Product->main_image ;
                $prod_cat[$key]['category_id'] = $row->Product->category_id ;
                $prod_cat[$key]['specialties'] = $row->Product->specialties ;
                $prod_cat[$key]['done_orders'] = $row->Product->done_orders ;
            }
            $data['technicians'] = $prod_cat ;
        }
        $response = APIHelpers::createApiResponse(false , 200 ,  '', '' , $data, $request->lang );
        return response()->json($response , 200);
    }

    public function technician_details(Request $request , $id){

        $lang = $request->lang ;
        Session::put('api_lang', $lang);

        $data['technicians'] = Product::where('id',$id)->with('Specialities_data')
            ->select('id','price','title_'.$lang.' as title','description_'.$lang.' as description','main_image as image')
            ->first()->makeHidden(['Product_categories','specialties','Orders_accepted']);
        $response = APIHelpers::createApiResponse(false , 200 ,  '', '' , $data, $request->lang );
        return response()->json($response , 200);
    }
    public function make_rate(Request $request ){
        $lang = $request->lang ;
        $user = auth()->user() ;
        $input = $request->all();
        $validator = Validator::make($input, [
            'technician_id' => 'required|exists:products,id',
            'rate' => 'required',
        ]);
        if ($validator->fails()) {
            $response = APIHelpers::createApiResponse(true, 406, $validator->messages()->first(), $validator->messages()->first(), null, $request->lang);
            return response()->json($response, 406);
        } else {
            if($user){
                $exists_rate = Rate::where('user_id',$user->id)->where('order_id',$request->technician_id)->first();
                if($exists_rate){
                    $response = APIHelpers::createApiResponse(true, 406,'this technician rated before', 'تم تقييم هذا الفني من قبل', null, $request->lang);
                    return response()->json($response, 406);
                }else{
                    $data['rate'] = $request->rate ;
                    $data['user_id'] = $user->id ;
                    $data['admin_approval'] = 1 ;
                    $data['order_id'] = $request->technician_id ;
                    Rate::create($data);
                    $response = APIHelpers::createApiResponse(false, 200, '', '', $data, $request->lang);
                    return response()->json($response, 200);
                }
            }else{
                $response = APIHelpers::createApiResponse(true, 406,'you should login first', 'يجب تسجيل الدخول', null, $request->lang);
                return response()->json($response, 406);
            }
        }
    }
}
