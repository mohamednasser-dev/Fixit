<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = ['product_id', 'price', 'visit_time', 'visit_date','user_id'];
    public function Product() {
        return $this->belongsTo('App\Product', 'product_id')->select('id','main_image as image','status','title_'.session('api_lang').' as title');
    }
}
