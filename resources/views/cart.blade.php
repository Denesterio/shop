@extends('layouts.app')

@section('content')

    <p>lkvmjmgfoper</p>

    @foreach($ordersProduct as $product)
        {{$product->title}} {{$product->quantity}}  {{$product->price}}
        {{$product->price * $product->quantity}}
    @endforeach
@endsection