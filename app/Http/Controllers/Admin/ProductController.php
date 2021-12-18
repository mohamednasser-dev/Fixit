<?php

namespace App\Http\Controllers\Admin;

use App\Product_category;
use App\Product_comment;
use App\Product_report;
use Illuminate\Support\Facades\Hash;
use JD\Cloudder\Facades\Cloudder;
use App\Category_option_value;
use Illuminate\Http\Request;
use App\SubThreeCategory;
use App\Product_feature;
use App\Category_option;
use App\SubFiveCategory;
use App\SubFourCategory;
use App\SubTwoCategory;
use App\ProductImage;
use App\Plan_details;
use App\SubCategory;
use Carbon\Carbon;
use App\Category;
use App\Product;
use App\Setting;
use App\Plan;
use App\User;

class ProductController extends AdminController
{
    // show
    public function show()
    {
        $data['products'] = Product::where('deleted', 0)->where('publish','Y')->orderBy('id', 'desc')->get();
        return view('admin.products.products', ['data' => $data]);
    }
    public function join_requests()
    {
        $data['products'] = Product::where('deleted', 0)->where('publish','N')->orderBy('id', 'desc')->get();
        return view('admin.products.join_requests', ['data' => $data]);
    }
    public function rejected()
    {
        $data['products'] = Product::where('deleted', 0)->where('publish','R')->orderBy('id', 'desc')->get();
        return view('admin.products.join_requests', ['data' => $data]);
    }
    public function acception($type, $id)
    {
        $data['publish'] = $type;
        Product::where('id', $id)->update($data);
        session()->flash('success', trans('messages.status_changed'));
        return back();
    }


    public function offers()
    {
        $data['offer_image'] = Setting::where('id', 1)->first()->offer_image;
        $data['offer_image_en'] = Setting::where('id', 1)->first()->offer_image_en;
        $data['products'] = Product::where('offer', 1)->where('deleted', 0)->orderBy('id', 'desc')->get();
        return view('admin.products.offers', ['data' => $data]);
    }

    public function chooses()
    {
        $data['products'] = Product::where('choose_it', 1)->where('deleted', 0)->orderBy('id', 'desc')->get();
        return view('admin.products.products', ['data' => $data]);
    }

    public function update_baner(Request $request)
    {
        $data = Setting::where('id', 1)->first();
        if ($request->image != null) {
            $image = $data->offer_image;
            $publicId = substr($image, 0, strrpos($image, "."));
            Cloudder::delete($publicId);
            $image_name = $request->file('image')->getRealPath();
            Cloudder::upload($image_name, null);
            $imagereturned = Cloudder::getResult();
            $image_id = $imagereturned['public_id'];
            $image_format = $imagereturned['format'];
            $image_new_name = $image_id . '.' . $image_format;
            $data->offer_image = $image_new_name;
            $data->save();
            session()->flash('success', trans('messages.updated_s'));
            return back();
        }
    }

    public function update_baner_english(Request $request)
    {
        $data = Setting::where('id', 1)->first();
        if ($request->image != null) {
            $image = $data->offer_image_en;
            $publicId = substr($image, 0, strrpos($image, "."));
            Cloudder::delete($publicId);
            $image_name = $request->file('image')->getRealPath();
            Cloudder::upload($image_name, null);
            $imagereturned = Cloudder::getResult();
            $image_id = $imagereturned['public_id'];
            $image_format = $imagereturned['format'];
            $image_new_name = $image_id . '.' . $image_format;
            $data->offer_image_en = $image_new_name;
            $data->save();
            session()->flash('success', trans('messages.updated_s'));
            return back();
        }
    }

    // add get
    public function addGet()
    {
        $data['categories'] = Category::orderBy('created_at', 'desc')->get();
        $data['users'] = User::orderBy('created_at', 'desc')->get();
        return view('admin.products.product_form', ['data' => $data]);
    }

    // add post
    public function AddPost(Request $request)
    {
        $data = $this->validate(\request(),
            [
                'title_ar' => 'required',
                'title_en' => 'required',
                'phone' => 'required',
                'email' => 'required|unique:products,email',
                'password' => 'required',
                'category_id' => 'required',
                'price' => 'required',
                'city_id' => 'required',
                'description_ar' => '',
                'description_en' => '',
                'main_image' => 'required',
            ]);
        if ($request->main_image != null) {
            $image_name = $request->file('main_image')->getRealPath();
            Cloudder::upload($image_name, null);
            $imagereturned = Cloudder::getResult();
            $image_id = $imagereturned['public_id'];
            $image_format = $imagereturned['format'];
            $image_new_name = $image_id . '.' . $image_format;
            $data['main_image'] = $image_new_name;
        }

        $data['publish'] = 'Y';
        $data['password'] = Hash::make($request->password);
        $product = Product::create($data);

        foreach ($request->categories as $cat) {
            $data_cat['product_id'] = $product->id;
            $data_cat['cat_id'] = $cat;
            Product_category::create($data_cat);
        }

        session()->flash('success', trans('messages.added_s'));
        return redirect()->route('products.index');
    }

    // edit get
    public function edit($id)
    {
        $data = Product::find($id);
        return view("admin.products.edit", compact('data'));
    }

    // edit post


    public function make_choose(Request $request, $id)
    {
        $product = Product::find($id);
        if ($product->choose_it == 1) {
            $data['choose_it'] = 0;
            Product::where('id', $id)->update($data);
            session()->flash('success', trans('messages.choosen_removed_done'));
        } else {
            $data['choose_it'] = 1;
            Product::where('id', $id)->update($data);
            session()->flash('success', trans('messages.choosen_done'));
        }
        return back();
    }

    public function make_offer(Request $request, $id)
    {
        $product = Product::find($id);
        if ($product->offer == 1) {
            $data['offer'] = 0;
            Product::where('id', $id)->update($data);
            session()->flash('success', trans('messages.offer_removed_done'));
        } else {
            $data['offer'] = 1;
            Product::where('id', $id)->update($data);
            session()->flash('success', trans('messages.offer_done'));
        }
        return back();
    }

    public function EditPost(Request $request, $id)
    {
        $prod = Product::find($id);
        $data = $this->validate(\request(),
            [
                'email' => 'required|unique:products,email,'.$id,
                'title_ar' => 'required',
                'title_en' => 'required',
                'phone' => 'required',
                'category_id' => 'required',
                'price' => 'required',
                'city_id' => 'required',
                'description_ar' => '',
                'description_en' => '',
            ]);
        if ($request->main_image != null) {
            $image = $prod->main_image;
            $publicId = substr($image, 0, strrpos($image, "."));
            Cloudder::delete($publicId);
            $image_name = $request->file('main_image')->getRealPath();
            Cloudder::upload($image_name, null);
            $imagereturned = Cloudder::getResult();
            $image_id = $imagereturned['public_id'];
            $image_format = $imagereturned['format'];
            $image_new_name = $image_id . '.' . $image_format;
            $data['main_image'] = $image_new_name;
        }
        if($request->password != null){
            $data['password'] = Hash::make($request->password);
        }
        Product::where('id', $id)->update($data);
        Product_category::where('product_id',$id)->delete();
        foreach ($request->categories as $cat) {
            $data_cat['product_id'] = $id;
            $data_cat['cat_id'] = $cat;
            Product_category::create($data_cat);
        }
        return redirect()->route('products.index');
    }

    // delete product image
    public function delete_product_image($id)
    {
        $image_data = ProductImage::where('id', $id)->first();
        $image = $image_data->image;
        $publicId = substr($image, 0, strrpos($image, "."));
        Cloudder::delete($publicId);
        ProductImage::where('id', $id)->delete();
        return redirect()->back();
    }

    // product details
    public function details($product_id)
    {
        $data = Product::where('id', $product_id)->first();
        return view('admin.products.product_details', compact('data'));
    }

    // delete product
    public function delete(Product $product)
    {
        if (count($product->images) > 0) {
            foreach ($product->images as $image) {
                $publicId = substr($image->image, 0, strrpos($image->image, "."));
                Cloudder::delete($publicId);
                $image->delete();
            }
        }
        $product->deleted = 1;
        $product->save();
        return redirect()->back();
    }

    public function get_sub_cat(Request $request, $id)
    {
        $data = SubCategory::where('category_id', $id)->where('deleted', 0)->get();
        return view('admin.products.parts.categories.sub_category', compact('data'));
    }

    public function get_sub_two_cat(Request $request, $id)
    {
        $data = SubTwoCategory::where('sub_category_id', $id)->where('deleted', 0)->get();
        return view('admin.products.parts.categories.sub_two_categories', compact('data'));
    }

    public function get_sub_three_cat(Request $request, $id)
    {
        $data = SubThreeCategory::where('sub_category_id', $id)->where('deleted', 0)->get();
        return view('admin.products.parts.categories.sub_three_categories', compact('data'));
    }

    public function get_sub_four_cat(Request $request, $id)
    {
        $data = SubFourCategory::where('sub_category_id', $id)->where('deleted', 0)->get();
        return view('admin.products.parts.categories.sub_four_categories', compact('data'));
    }

    public function get_sub_five_cat(Request $request, $id)
    {
        $data = SubFiveCategory::where('sub_category_id', $id)->where('deleted', '0')->get();
        return view('admin.products.parts.categories.sub_five_categories', compact('data'));
    }

    public function get_brands(Request $request, $id)
    {
        $cat_option = Category_option::where('cat_id', $id)->where('title_en', 'brand')->first();

        $data = Category_option_value::where('option_id', $cat_option->id)->where('deleted', '0')->get();

        return view('admin.products.parts.options.brands', compact('data'));
    }

    public function get_brand_types(Request $request, $id)
    {
        $cat_option = Category_option::where('cat_id', $id)->where('title_en', 'brand type')->first();
        $data = Category_option_value::where('option_id', $cat_option->id)->where('deleted', '0')->get();
        return view('admin.products.parts.options.brand_types', compact('data'));
    }

    public function get_model_year(Request $request, $id)
    {
        $cat_option = Category_option::where('cat_id', $id)->where('title_en', 'model year')->first();
        $data = Category_option_value::where('option_id', $cat_option->id)->where('deleted', '0')->get();
        return view('admin.products.parts.options.model_years', compact('data'));
    }

    public function get_counter(Request $request, $id)
    {
        $cat_option = Category_option::where('cat_id', $id)->where('title_en', 'speedometer')->first();
        $data = Category_option_value::where('option_id', $cat_option->id)->where('deleted', '0')->get();
        return view('admin.products.parts.options.counter', compact('data'));
    }

    public function get_plan(Request $request, $id)
    {
        $data = Plan::where('status', 'show')
            ->where('cat_id', $id)
            ->orwhere('cat_id', 'all')
            ->get();
        return view('admin.products.parts.plans.plans', compact('data'));
    }

    // reports page functions .............
    public function reports()
    {
        $data = Product_report::where('status','!=', 'take action')->orderBy('id', 'desc')->get();
        $seen_data['status'] = 'seen';
        Product_report::where('status', 'new')->update($seen_data);
        return view('admin.products.products_reported',compact('data'));
    }

    public function reports_delete($id)
    {
        $report =  Product_report::find($id);
        $data['deleted'] =  '1';
        $user = Product::where('id', $report->product_id)->update($data);
        $seen_data['status'] = 'take action';
        Product_report::where('id', $id)->update($seen_data);
        session()->flash('success', trans('messages.deleted_s'));
        return back();
    }

    public function update_publish(Request $request){

        $report =  Product_report::find($request->id);
        $data['publish'] = $request->status ;
        $user = Product::where('id', $report->product_id)->update($data);

        $seen_data['status'] = 'take action';
        Product_report::where('id', $request->id)->update($seen_data);
        if($request->status == 'Y'){
            return 1;
        }else{
            return 2;
        }
    }
    // product comments page functions .............
    public function comments()
    {
        $data = Product_comment::where('status','new')->orderBy('id', 'desc')->get();
        return view('admin.products.products_comments',compact('data'));
    }
    public function product_comments($id)
    {
        $data = Product_comment::where('product_id',$id)->orderBy('id', 'desc')->get();
        return view('admin.products.products_comments',compact('data'));
    }
    public function comment_approval($type,$id)
    {
        $status_data['status'] = $type ;
        Product_comment::where('id',$id)->update($status_data);
        if($type == 'accepted'){
            session()->flash('success', trans('messages.accepted_done'));
        }else{
            session()->flash('success', trans('messages.rejected_done'));
        }
        return back();
    }

}
