<?php

namespace App;

use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Product extends Authenticatable implements JWTSubject
{
    protected $appends = ['specialties','done_orders','rate'];
    //    protected $dates = ['publication_date'];
    protected $guarded = [];


    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }
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
        return $this->belongsTo('App\Governorate', 'city_id');
    }
    public function Area() {
        return $this->belongsTo('App\Area', 'area_id');
    }
    public function Product_categories() {
        return $this->hasMany('App\Product_category', 'product_id');
    }
    public function Orders_accepted() {
        return $this->hasMany('App\Order', 'product_id')->where('status','accept');
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

    public function getDoneOrdersAttribute($price)
    {
            return $this->Orders_accepted->count() ;
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


    public function getRateAttribute($image)
    {
        $count_rates = Rate::where('order_id',$this->id)->get()->count();
        if($count_rates == 0){
            return 0 ;
        }
        $sum_rates = Rate::where('order_id',$this->id)->get()->sum('rate');
        $rate = $sum_rates / $count_rates;
        return $rate ;
    }
}
