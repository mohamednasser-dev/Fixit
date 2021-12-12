@extends('admin.app')
@section('title' , __('messages.add_new_tech'))
@section('styles')

@endsection
@section('content')
    <div class="col-lg-12 col-12 layout-spacing">
        <div class="statbox widget box box-shadow">
            <div class="widget-header">
                <div class="row">
                    <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                        <h4>{{ __('messages.add_new_tech') }}</h4>
                    </div>
                </div>
                <form method="post" enctype="multipart/form-data" action="">
                    @csrf
                    <div class="form-group mb-4">
                        <label for="title">{{ __('messages.tec_name_ar') }}</label>
                        <input required type="text" name="title_ar" class="form-control" id="title_ar">
                    </div>
                    <div class="form-group mb-4">
                        <label for="title">{{ __('messages.tec_name_en') }}</label>
                        <input required type="text" name="title_en" class="form-control" id="title_en">
                    </div>
                    <div class="form-group mb-4">
                        <label for="title">{{ __('messages.phone') }}</label>
                        <input required type="text" name="phone" class="form-control" id="phone">
                    </div>
                    <div class="form-group mb-4">
                        <label for="title">{{ __('messages.email') }}</label>
                        <input required type="email" name="email" class="form-control" id="email">
                    </div>
                    <div class="form-group mb-4">
                        <label for="title">{{ __('messages.password') }}</label>
                        <input required type="password" name="password" class="form-control" id="password">
                    </div>
                    <div class="form-group">
                        @php $cats = \App\Category::where('deleted',0)->orderBy('sort','asc')->get(); @endphp
                        <label for="sel1">{{ __('messages.category') }}</label>
                        <select required class="form-control" name="category_id" id="cmb_cat">
                            <option selected disabled>{{ __('messages.choose_category') }}</option>
                            @foreach ($cats as $row)
                                @if( app()->getLocale() == 'en')
                                    <option value="{{ $row->id }}">{{ $row->title_en }}</option>
                                @else
                                    <option value="{{ $row->id }}">{{ $row->title_ar }}</option>
                                @endif
                            @endforeach
                        </select>
                    </div>
                    {{--                    // 1--}}
                    <div class="form-group" id="sub_cat_cont" style="display:none;">
                        @php $sub_cats = \App\SubCategory::where('deleted',0)->get(); @endphp
                        <label for="sel1">{{ __('messages.sub_category_first') }}</label>
                        <select class="form-control tagging" name="categories[]" id="cmb_sub_cat" multiple="multiple">
                            @foreach ($sub_cats as $row)
                                @if( app()->getLocale() == 'en')
                                    <option value="{{ $row->id }}">{{ $row->title_en }}</option>
                                @else
                                    <option value="{{ $row->id }}">{{ $row->title_ar }}</option>
                                @endif
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        @php $cities = \App\Governorate::where('deleted',0)->orderBy('created_at','asc')->get(); @endphp
                        <label for="sel1">{{ __('messages.city') }}</label>
                        <select required class="form-control" name="city_id" id="cmb_city_id">
                            <option selected disabled>{{ __('messages.choose_city') }}</option>
                            @foreach ($cities as $row)
                                @if( app()->getLocale() == 'en')
                                    <option value="{{ $row->id }}">{{ $row->title_en }}</option>
                                @else
                                    <option value="{{ $row->id }}">{{ $row->title_ar }}</option>
                                @endif
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group mb-4">
                        <label for="price">{{ __('messages.product_price') }}</label>
                        <input required type="number" class="form-control" step="any" min="0" id="price" name="price"
                               placeholder="{{ __('messages.product_price') }}">
                    </div>
                    <div class="form-group mb-4 arabic-direction">
                        <label for="description">{{ __('messages.description_ar') }}</label>
                        <textarea required name="description_ar"
                                  class="form-control" id="description" rows="5"></textarea>
                    </div>
                    <div class="form-group mb-4 arabic-direction">
                        <label for="description">{{ __('messages.description_en') }}</label>
                        <textarea required name="description_en"
                                  class="form-control" id="description" rows="5"></textarea>
                    </div>
                    <div class="custom-file-container" data-upload-id="myFirstImage">
                        <label>{{ __('messages.upload') }} ({{ __('messages.single_image') }}) <a
                                href="javascript:void(0)" class="custom-file-container__image-clear"
                                title="Clear Image">x</a></label>
                        <label class="custom-file-container__custom-file">
                            <input type="file" required name="main_image"
                                   class="custom-file-container__custom-file__custom-file-input" accept="image/*">
                            <input type="hidden" name="MAX_FILE_SIZE" value="10485760"/>
                            <span class="custom-file-container__custom-file__custom-file-control"></span>
                        </label>
                        <div class="custom-file-container__image-preview"></div>
                    </div>
                    <input type="submit" value="{{ __('messages.add') }}" class="btn btn-primary">
                </form>
            </div>
        </div>
    </div>
@endsection
@section('scripts')
    <script src="/admin/assets/js/generate_categories.js"></script>
@endsection
