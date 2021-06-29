@extends('layouts.app')

@section('content')
        <products-component
          :categories='{{$categories}}'
          :subcategories='{{$subcategories}}'
          :tags='{{$tags}}'
        ></products-component>
@endsection