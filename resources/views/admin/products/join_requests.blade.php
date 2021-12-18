@extends('admin.app')
    @section('title' , __('messages.show_technicians'))
@section('content')
    <div id="tableSimple" class="col-lg-12 col-12 layout-spacing">
        <div class="statbox widget box box-shadow">
            <div class="widget-header">
                <div class="row">
                    <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                        <h4>{{ __('messages.show_technicians') }}</h4>
                    </div>
                </div>
            </div>
            <div class="widget-content widget-content-area">
                <div class="table-responsive">
                    <table id="html5-extension" class="table table-hover non-hover" style="width:100%">
                        <thead>
                        <tr>
                            <th class="text-center">Id</th>
                            <th class="text-center">{{ __('messages.image') }}</th>
                            <th class="text-center">{{ __('messages.product_name') }}</th>
                            <th class="text-center">{{ __('messages.product_price') }}</th>
                            <th class="text-center">{{ __('messages.details') }}</th>
                            <th class="text-center">{{ __('messages.actions') }}</th>

                        </tr>
                        </thead>
                        <tbody>
                        <?php $i = 1; ?>
                        @foreach ($data['products'] as $product)
                            <tr>
                                <td class="text-center"><?=$i;?></td>
                                <td class="text-center"><img src="{{image_cloudinary_url()}}{{ $product->main_image }}"/>
                                <td class="text-center">  {{ (app()->getLocale() == 'ar')? $product->title_ar :  $product->title_en }}</td>
                                <td class="text-center">  {{$product->price}}</td>
                                <td class="text-center blue-color">
                                    <a href="{{ route('products.details', $product->id) }}"><i class="far fa-eye"></i></a>
                                </td>
                                <td class="text-center blue-color">
                                    <div class="btn-group">
                                        <button type="button"
                                                class="btn btn-dark btn-sm">{{ __('messages.acception') }}</button>
                                        <button type="button"
                                                class="btn btn-dark btn-sm dropdown-toggle dropdown-toggle-split"
                                                id="dropdownMenuReference5" data-toggle="dropdown"
                                                aria-haspopup="true" aria-expanded="false" data-reference="parent">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                 viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                 stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                 class="feather feather-chevron-down">
                                                <polyline points="6 9 12 15 18 9"></polyline>
                                            </svg>
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuReference5">
                                            <a class="dropdown-item"
                                               href="{{route('product.acception',['id'=>$product->id , 'type'=>'Y'])}}"
                                               style="color: limegreen; text-align: center;">
                                                {{ __('messages.accept') }}
                                            </a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item"
                                               href="{{route('product.acception',['id'=>$product->id , 'type'=>'R'])}}"
                                               style="color: red; text-align: center;">
                                                {{ __('messages.reject') }}
                                            </a>
                                        </div>
                                    </div>
                                </td>

                                <?php $i++; ?>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

