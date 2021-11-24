@extends('admin.app')

@section('title' , __('messages.ad_edit'))



@push('scripts')
    <script>
        $("#ad_type").on("change", function() {
            if(this.value == 1) {
                $(".outside").show()
                $('.productsParent').hide()
                $('select#products').prop("disabled", true)
                $(".outside input").prop("disabled", false)
                $(".inside").hide()
            }else {
                $(".outside").hide()
                $(".outside input").prop("disabled", true)
                $(".inside").show()
            }
        })
    </script>
@endpush

@section('content')
    <div class="col-lg-12 col-12 layout-spacing">
        <div class="statbox widget box box-shadow">
            <div class="widget-header">
                <div class="row">
                    <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                        <h4>{{ __('messages.ad_edit') }}</h4>
                 </div>
        </div>
        <form action="{{route('offers.update')}}" method="post" enctype="multipart/form-data" >
            @csrf
            <div class="form-group mb-4">
                <label for="">{{ __('messages.current_image') }}</label><br>
                <img src="{{image_cloudinary_url()}}{{ $data['ad']['image'] }}"  />
            </div>
            <div class="custom-file-container" data-upload-id="myFirstImage">
                <label>{{ __('messages.change_image') }} ({{ __('messages.single_image') }}) <a href="javascript:void(0)" class="custom-file-container__image-clear" title="Clear Image">x</a></label>
                <label class="custom-file-container__custom-file" >
                    <input type="file" name="image" class="custom-file-container__custom-file__custom-file-input" accept="image/*">
                    <input type="hidden" name="MAX_FILE_SIZE" value="10485760" />
                    <span class="custom-file-container__custom-file__custom-file-control"></span>
                </label>
                <div class="custom-file-container__image-preview"></div>
            </div>
{{--            <div class="form-group">--}}
{{--                <label for="sel1">{{ __('messages.ad_place') }}</label>--}}
{{--                <select class="form-control" name="place" id="sel1">--}}
{{--                    <option selected>{{ __('messages.select') }}</option>--}}
{{--                    <option {{ $data['ad']['place'] == 1 ? 'selected' : '' }} value="1">{{ __('messages.on_the_top') }}</option>--}}
{{--                    <option {{ $data['ad']['place'] == 2 ? 'selected' : '' }} value="2">{{ __('messages.on_the_middle') }}</option>--}}
{{--                </select>--}}
{{--            </div>--}}

{{--            <div class="form-group">--}}
{{--                <label for="sel1">{{ __('messages.ad_type') }}</label>--}}
{{--                <select id="ad_type" name="type" class="form-control">--}}
{{--                    <option selected>{{ __('messages.select') }}</option>--}}
{{--                    <option {{ $data['ad']['type'] == 'link' ? 'selected' : '' }} value="1">{{ __('messages.outside_the_app') }}</option>--}}
{{--                    <option {{ $data['ad']['type'] == 'id' ? 'selected' : '' }} value="2">{{ __('messages.inside_the_app') }}</option>--}}
{{--                </select>--}}
{{--            </div>--}}

            <input required type="hidden" name="id" class="form-control" value="{{$data['ad']['id'] }}" >
            <input required type="hidden" name="place" class="form-control" value="3" >
            <input required type="hidden" name="type" class="form-control" value="1" >
            <div class="form-group mb-4 outside">
                <label for="link">{{ __('messages.link') }}</label>
                <input required type="text" name="content" class="form-control" id="link" placeholder="{{ __('messages.link') }}" value="{{ $data['ad']['content'] }}" >
            </div>



            <div style="display: none" class="form-group productsParent">
                <label for="products">{{ __('messages.product') }}</label>
                <select id="products" class="form-control" name="content">
                </select>
            </div>

            <input type="submit" value="{{ __('messages.edit') }}" class="btn btn-primary">
        </form>
    </div>
@endsection
