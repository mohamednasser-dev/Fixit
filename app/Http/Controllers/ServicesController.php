<?php

namespace App\Http\Controllers;

use App\Category;
use App\Product;
use App\SubCategory;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Request;
use App\Helpers\APIHelpers;

class ServicesController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api' , ['except' => [ 'service_details','technician_details']]);
    }

    public function service_details(Request $request , $id){
        $lang = $request->lang ;
        Session::put('api_lang', $lang);
        $data['service_categories'] = SubCategory::where('category_id',$id)->select('id','title_'.$lang.' as title')->orderBy('created_at','desc')->get()->toArray();
        $title = 'All';
        if ($lang == 'ar') {
            $title = 'الكل';
        }
        $all = new \StdClass;
        $all->id = 0;
        $all->title = $title;
        array_unshift($data['service_categories'], $all);

        $data['technicians'] = Product::where('category_id',$id)->select('id','title_'.$lang.' as title','main_image as image')->get()->makeHidden(['Product_categories']);
        $response = APIHelpers::createApiResponse(false , 200 ,  '', '' , $data, $request->lang );
        return response()->json($response , 200);
    }

    public function technician_details(Request $request , $id){

        $lang = $request->lang ;
        Session::put('api_lang', $lang);

        $data['technicians'] = Product::where('id',$id)->with('Specialities_data')->select('id','price','title_'.$lang.' as title','description_'.$lang.' as description','main_image as image')->first()->makeHidden(['Product_categories','specialties']);
        $response = APIHelpers::createApiResponse(false , 200 ,  '', '' , $data, $request->lang );
        return response()->json($response , 200);
    }

}
