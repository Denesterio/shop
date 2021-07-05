@extends('layouts.app')

@section('content')
    <profile-component :orders='{{$orders}}' :user="{{$user}}" />
@endsection