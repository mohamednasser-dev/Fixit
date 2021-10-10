<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = ['product_id', 'price', 'visit_time', 'visit_date','user_id'];
    public function Product() {
        return $this->belongsTo('App\Product', 'product_id')->select('id','main_image as image','status','title_'.session('api_lang').' as title');
    }

    public function  getVisitTimeAttribute($data){
        return Carbon::createFromFormat('H:i:s', $data)->format('g:i a');
    }
    public function  getVisitDateAttribute($data){
        if(session('local_api') == 'ar') {
            return Carbon::createFromFormat('Y-m-d', $data)->translatedformat('Y l d F');
        }else{
            return Carbon::createFromFormat('Y-m-d', $data)->format('Y F d l');
        }
    }
}
