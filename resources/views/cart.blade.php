@extends('layouts.app')

@section('content')

    @foreach($orderProducts as $product)
        <cart-component :order-products='{{$orderProducts}}'/>
    @endforeach

@endsection