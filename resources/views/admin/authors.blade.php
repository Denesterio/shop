@extends('layouts.app')

@section('content')
    <authors-list-component
        title="{{$title}}"
        :authors="{{$authors}}"
    />
@endsection