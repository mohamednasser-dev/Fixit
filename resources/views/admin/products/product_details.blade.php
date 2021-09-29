@extends('admin.app')

@section('title' , __('messages.product_details'))

@section('content')
    <div id="tableSimple" class="col-lg-12 col-12 layout-spacing">
        <div class="statbox widget box box-shadow">
            <div class="widget-header">
                <div class="row">
                    <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                        <h4>{{ __('messages.product_details') }}</h4>
                    </div>
                </div>
            </div>
            <div class="widget-content widget-content-area">
                <div class="table-responsive">
                    <table class="table table-bordered mb-4">
                        <tbody>
                        <tr>
                            <td class="label-table"> {{ __('messages.product_name') }}</td>
                            <td>
                                {{ (app()->getLocale() == 'ar') ? $data->title_ar  : $data->title_en }}
                            </td>
                        </tr>
                        <tr>
                            <td class="label-table"> {{ __('messages.category') }} </td>
                            <td>
                                <span
                                    class="badge outline-badge-success">{{ (app()->getLocale() == 'ar') ? $data->category->title_ar  : $data->category->title_en }}</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="label-table"> {{ __('messages.sub_category_first') }} </td>
                            <td>
                                @foreach($data->Product_categories as $row)
                                    <span
                                        class="badge outline-badge-primary">{{ (app()->getLocale() == 'ar') ? $row->Category->title_ar  : $row->Category->title_en }}</span>
                                @endforeach
                            </td>
                        </tr>
                        <tr>
                            <td class="label-table"> {{ __('messages.city') }} </td>
                            <td>
                                <span
                                    class="badge outline-badge-warning">{{ (app()->getLocale() == 'ar') ? $data->City->title_ar  : $data->City->title_en }}</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="label-table"> {{ __('messages.product_description') }} </td>
                            <td>
                                {{ (app()->getLocale() == 'ar') ? $data->description_ar  : $data->description_en }}
                            </td>
                        </tr>
                        <tr>
                            <td class="label-table"> {{ __('messages.product_price') }} </td>
                            <td>
                                {{ $data->price }} {{ __('messages.dinar') }}
                            </td>
                        </tr>

                        </tbody>
                    </table>
                    <label for="">{{ __('messages.main_image') }}</label><br>
                    <div class="row">
                        <div class="col-md-2 product_image">
                            <img style="width: 100%" src="{{image_cloudinary_url()}}{{ $data->main_image }}"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
