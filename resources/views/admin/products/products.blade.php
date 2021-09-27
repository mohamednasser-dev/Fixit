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
                <div class="row">
                    <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                        <a class="btn btn-primary" href="/admin-panel/products/add">{{ __('messages.add') }}</a>
                    </div>
                </div>
            </div>
            <div class="widget-content widget-content-area">
                <div class="table-responsive">
                    <table id="html5-extension" class="table table-hover non-hover" style="width:100%">
                        <thead>
                        <tr>
                            <th class="text-center">Id</th>
                            <th class="text-center">{{ __('messages.product_name') }}</th>
                            <th class="text-center">{{ __('messages.product_price') }}</th>
                            <th class="text-center">{{ __('messages.details') }}</th>
                            @if(Auth::user()->update_data)
                                <th class="text-center">{{ __('messages.edit') }}</th>
                            @endif
                            @if(Auth::user()->delete_data)
                                <th class="text-center">{{ __('messages.delete') }}</th>
                            @endif
                        </tr>
                        </thead>
                        <tbody>
                        <?php $i = 1; ?>
                        @foreach ($data['products'] as $product)
                            <tr>
                                <td class="text-center"><?=$i;?></td>
                                <td class="text-center">  {{ (app()->getLocale() == 'ar')? $product->title_ar :  $product->title_en }}</td>
                                <td class="text-center">  {{$product->price}}</td>
                                <td class="text-center blue-color">
                                    <a href="{{ route('products.details', $product->id) }}"><i class="far fa-eye"></i></a>
                                </td>
                                @if(Auth::user()->update_data)
                                    <td class="text-center blue-color"><a
                                            href="/admin-panel/products/edit/{{ $product->id }}"><i
                                                class="far fa-edit"></i></a></td>
                                @endif
                                @if(Auth::user()->delete_data)
                                    <td class="text-center blue-color">
                                        <a onclick="return confirm('{{ __('messages.are_you_sure') }}');"
                                            href="{{ route('delete.product', $product->id) }}"><i
                                                class="far fa-trash-alt"></i></a></td>
                                @endif
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

