<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
protected $appends = ['specialties'];
//    protected $dates = ['publication_date'];
    protected $fillable = ['title_ar','title_en','description_ar','description_en', 'price','category_id','sub_category_id','sub_category_two_id','expire_special_date',
        'sub_category_three_id','sub_category_four_id','user_id', 'type','publication_date','re_post_date','is_special',
        'views', 'offer', 'status', 'expiry_date','main_image','expire_pin_date','created_at','plan_id','publish','pin',
        'sub_category_five_id','choose_it','city_id','area_id','latitude','longitude','share_location','deleted','retweet_date','retweet'];
    public function category() {
        return $this->belongsTo('App\Category', 'category_id');
    }
    public function Sub_category() {

        return $this->belongsTo('App\SubCategory', 'sub_category_id')->select('id','title_'.session('api_lang').' as title');
    }
    public function user() {
        return $this->belongsTo('App\User', 'user_id');
    }

    public function Publisher() {
        return $this->belongsTo('App\User', 'user_id')->select('id','name','account_type')->with('Account_type');
    }

    public function Product_user() {
        return $this->belongsTo('App\User', 'user_id')->select('id','image','name','email','phone','watsapp');
    }
    public function Plan() {
        return $this->belongsTo('App\Plan', 'plan_id');
    }
    public function images() {
        return $this->hasMany('App\ProductImage', 'product_id');
    }
    public function Features() {
        return $this->hasMany('App\Product_feature', 'product_id');
    }
    public function Views() {
        return $this->hasMany('App\Product_view', 'product_id');
    }
    public function Categories() {
        return $this->hasMany('App\Product_category', 'product_id');
    }
    public function City() {
        return $this->belongsTo('App\City', 'city_id');
    }
    public function Area() {
        return $this->belongsTo('App\Area', 'area_id');
    }
    public function Product_categories() {
        return $this->hasMany('App\Product_category', 'product_id');
    }

    public function Specialities_data() {
        return $this->hasMany('App\Product_category', 'product_id')->with('Category_data')->select('id','product_id','cat_id');
    }



    public function A() {
        return $this->hasMany('App\Product_category', 'product_id');
    }
    public function getSpecialtiesAttribute()
    {
        $result = "";
        if(session('api_lang') == 'ar'){
            foreach ($this->Product_categories as $speciality){
                $result = $result . $speciality->Category->title_ar . ' - ';
            }
        }else{
            foreach ($this->Product_categories as $speciality){
                $result = $result . $speciality->Category->title_en . ' - ';
            }
        }
        return $result ;
    }
    public function getPriceAttribute($price)
    {
        if($price != null){
            return number_format((float)($price), 3);
        }else{
            return null ;
        }
    }

    public function Area_name() {
        if(session('lang') == 'ar') {
            return $this->belongsTo('App\Area', 'area_id')->select('id','title_ar as title');
        }else{
            return $this->belongsTo('App\Area', 'area_id')->select('id','title_en as title');
        }
    }

    public function City_api() {
        if(session('local_api') == 'ar'){
            return $this->belongsTo('App\City', 'city_id')->select('id','title_ar as title');
        }else{
            return $this->belongsTo('App\City', 'city_id')->select('id','title_en as title');
        }
    }
    public function Area_api() {
        if(session('local_api') == 'ar'){
            return $this->belongsTo('App\Area', 'area_id')->select('id','title_ar as title');
        }else{
            return $this->belongsTo('App\Area', 'area_id')->select('id','title_en as title');
        }
    }
}
