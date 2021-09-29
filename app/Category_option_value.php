<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category_option_value extends Model
{
    protected $fillable = ['image','price','value_ar', 'value_en', 'option_id','deleted'];

    public function getPriceAttribute($price)
    {
        if($price != null){
            return number_format((float)($price), 3);
        }else{
            return null ;
        }
    }
}
