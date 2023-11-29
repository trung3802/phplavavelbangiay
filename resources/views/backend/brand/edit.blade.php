@extends('backend.layouts.master')
@section('title','E-SHOP || Brand Edit')
@section('main-content')

<div class="card">
    <div class="card-header py-3">
    <div class="col-sm-6">
        <ol class="breadcrumb float-sm-left">
            <li class="breadcrumb-item"><a href="{{ route('admin') }}"> <i class="nav-icon fas fa fa-home"></i> Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="{{ route('brand.index') }}">Thương hiệu</a></li>
            <li class="breadcrumb-item active">Cập nhật</li>
        </ol>
    </div>
    </div>
    <div class="card-body">
      <form method="post" action="{{route('brand.update',$brand->id)}}">
        @csrf
        @method('PATCH')
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Tên thương hiệu <span class="text-danger">*</span></label>
        <input id="inputTitle" type="text" name="title" placeholder="Enter title"  value="{{$brand->title}}" class="form-control">
        @error('title')
        <span class="text-danger">{{$message}}</span>
        @enderror
        </div>
        <div class="form-group">
            <label for="inputPhoto" class="col-form-label">Photo <span class="text-danger">*</span></label>
            <div class="input-group">
                
            <input id="thumbnail" class="form-control" type="text" name="photo" value="{{$brand->photo}}">
          </div>
        </div>
        <div id="holder" style="margin-top:15px;max-height:100px;"></div>
        @error('photo')
        <span class="text-danger">{{$message}}</span>
        @enderror
        <div class="form-group">
          <label for="status" class="col-form-label">Trạng thái <span class="text-danger">*</span></label>
          <select name="status" class="form-control">
            <option value="active" {{(($brand->status=='active') ? 'selected' : '')}}>Active</option>
            <option value="inactive" {{(($brand->status=='inactive') ? 'selected' : '')}}>Inactive</option>
          </select>
          @error('status')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group mb-3">
           <button class="btn btn-success" type="submit">Cập nhật</button>
        </div>
      </form>
    </div>
</div>

@endsection

@push('styles')
<link rel="stylesheet" href="{{asset('backend/summernote/summernote.min.css')}}">
@endpush
@push('scripts')
<script src="/vendor/laravel-filemanager/js/stand-alone-button.js"></script>
<script src="{{asset('backend/summernote/summernote.min.js')}}"></script>

@endpush
