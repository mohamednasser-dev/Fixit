
@if(app()->getLocale() == 'ar')
    @forelse($data as $row)
        <option value="{{$row->id}}">{{$row->title_ar}}</option>
    @empty
        <option disabled selected=""> لا يوجد أقسام فرعية حتى الأن </option>
    @endforelse
@else
    @forelse($data as $row)
        <option value="{{$row->id}}">{{$row->title_en}}</option>
    @empty
        <option disabled selected=""> no sub category until now</option>
    @endforelse
@endif
