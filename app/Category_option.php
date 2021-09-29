<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category_option extends Model
{
    protected $fillable = ['title_ar','image', 'title_en', 'cat_id','cat_type','deleted','is_required'];

    public function Option_value() {
        return $this->hasMany('App\Category_option_value', 'option_id');
    }

}
