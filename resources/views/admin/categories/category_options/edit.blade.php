@extends('admin.app')

@section('title' , __('messages.category_edit'))

@section('content')
    <div class="col-lg-12 col-12 layout-spacing">
        <div class="statbox widget box box-shadow">
            <div class="widget-header">
                <div class="row">
                    <div class="col-xl-12 col-md-12 col-sm-12 col-12">

                        <h4>{{ __('messages.category_options_edit') }}</h4>
                    </div>
                </div>
                <form action="{{route('cat_options.update_new')}}" method="post" enctype="multipart/form-data">
                    @csrf
                    <input required type="hidden" name="id" value="{{$data->id}}">
                    <div class="card-body">
                        <div class="form-group mb-4">
                            <label for="title_ar">{{ __('messages.name_ar') }}</label>
                            <input required type="text" name="title_ar" value="{{$data->title_ar}}" class="form-control"
                                   id="title_ar"
                                   placeholder="{{ __('messages.name_ar') }}">
                        </div>
                        <div class="form-group mb-4">
                            <label for="title_ar">{{ __('messages.name_en') }}</label>
                            <input required type="text" name="title_en" value="{{$data->title_en}}" class="form-control"
                                   id="title_en"
                                   placeholder="{{ __('messages.name_en') }}">
                        </div>
                    </div>
                    <input type="submit" value="{{ __('messages.edit') }}" class="btn btn-primary">
                </form>
            </div>
        </div>
    </div>
@endsection
