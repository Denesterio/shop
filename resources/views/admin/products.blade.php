@extends('layouts.app')

@section('content')
        <products-component
          :categories='{{$categories}}'
          :subcategories='{{$subcategories}}'
          :authors='{{$authors}}'
          :tags='{{$tags}}'
        ></products-component>
@endsection