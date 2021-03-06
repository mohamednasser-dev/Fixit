<?php
namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Setting;

class AppPagesController extends AdminController{

    // get about app edit page
    public function GetAboutApp(){
        $data['setting'] = Setting::find(1);
        return view('admin.aboutapp' , ['data' => $data]);
    }

    // post about app edit page
    public function PostAboutApp(Request $request){
        if(!$request->aboutapp_ar){
            return redirect('admin-panel/app_pages/aboutapp')->with('status' , 'About App Text in Arabic Required');
        }
        $setting = Setting::find(1);
        $setting->aboutapp_ar = $request->aboutapp_ar;
        $setting->aboutapp_en = $request->aboutapp_en;
        // return $setting;
        $setting->save();
        return redirect('admin-panel/app_pages/aboutapp');
    }

    // get commission edit page
    public function GetCommission(){
        $data['setting'] = Setting::where('id', 1)->select('id', 'commission_en', 'commission_ar')->first();
        return view('admin.commission' , ['data' => $data]);
    }

    // post about app edit page
    public function PostCommission(Request $request){
        if(!$request->commission_ar){
            return redirect('admin-panel/app_pages/commission')->with('status' , 'About App Text in Arabic Required');
        }
        $setting = Setting::where('id', 1)->select('id', 'commission_en', 'commission_ar')->first();
        $setting->commission_ar = $request->commission_ar;
        $setting->commission_en = $request->commission_en;
        // return $setting;
        $setting->save();
        return redirect('admin-panel/app_pages/commission');
    }

    // get Terms And Conditions edit page
    public function GetTermsAndConditions(){
        $data['setting'] = Setting::find(1);
        return view('admin.termsandconditions' , ['data' => $data]);
    }

    // get Terms And Conditions edit page
    public function PostTermsAndConditions(Request $request){
        if(!$request->termsandconditions_ar || !$request->termsandconditions_en ){
            return redirect('admin-panel/app_pages/termsandconditions')->with('status' , 'Terms And Conditions Text in Arabic Required');
        }
        $setting = Setting::find(1);
        $setting->termsandconditions_ar = $request->termsandconditions_ar;
        $setting->termsandconditions_en = $request->termsandconditions_en;
        $setting->save();
        session()->flash('success', trans('messages.updated_s'));
        return redirect('admin-panel/app_pages/termsandconditions');
    }


}
