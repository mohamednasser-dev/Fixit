<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product_category extends Model
{
    protected $fillable = [ 'product_id','cat_id'];

    public function Product() {
        return $this->belongsTo('App\Product', 'product_id');
    }

    public function Category() {
        return $this->belongsTo('App\SubCategory', 'cat_id');
    }

    public function Category_data() {
        return $this->belongsTo('App\SubCategory', 'cat_id')->select('id','title_'.session('api_lang').' as title');
    }
}
