<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Setting;

class WebViewController extends Controller
{
    // get about
    public function getabout(Request $request, $lang){
        $setting = Setting::find(1);
        $data['text'] = $setting['aboutapp_ar'];
		$data['lang'] = $lang;
        return view('webview.about' , ['data' => $data]);
    }

    public function getcommission(Request $request, $lang) {
        $data = Setting::where('id', 1)->select('commission_' . $lang . ' as commission')->first();
        $data['lang'] = $lang;
        return view('webview.commission' , ['data' => $data]);
    }

    // get terms and conditions
    public function gettermsandconditions(Request $request, $lang){
        $setting = Setting::find(1);

            $data['title'] = 'الشروط و الأحكام';
            $data['text'] = $setting['termsandconditions_ar'];
		$data['lang'] = $lang;
        return view('webview.termsandconditions' , ['data' => $data]);
    }

    public function homePage() {
        return view('index');
    }
}
