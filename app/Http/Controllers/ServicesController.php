<?php

namespace App\Http\Controllers;

use App\Category;
use App\Product;
use App\Product_category;
use App\Setting;
use App\SubCategory;
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
        $this->middleware('auth:api' , ['except' => [ 'details','technician_details']]);
    }

    public function details(Request $request , $id , $cat_id){
        $lang = $request->lang ;
        Session::put('api_lang', $lang);
        $setting = Setting::find(1);
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
            $data['technicians'] = Product::where('city_id',$setting->city_id)->where('category_id',$id)->select('id','title_'.$lang.' as title','main_image as image','category_id')
                ->get()->makeHidden(['Product_categories']);
        }else{
            $technicians_data = Product_category::
            with('Product')->with('Category_data')
            ->whereHas('Product',function ($q) use($setting){
                $q->where('city_id',$setting->city_id);
            })->where('cat_id',$cat_id)->get();
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
            }
            $data['technicians'] = $prod_cat ;
        }
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
