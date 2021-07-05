@extends('layouts.app')

@section('content')
    <div class="row">
        <aside class="col-md-4">
            <left-menu-component
                :categories='{{$categories}}'
                :subcategories='{{$subcategories}}'
            ></left-menu-component>
        </aside>
        <main class="col-md-8">
            <welcome-category-list-component
                :categories='{{$categories}}'
            ></welcome-category-list-component>
        </main>
    </div>
    <section>
        <h4>Новинки:</h4>
        <carousel-component
                :products="{{$products}}"
                :authors="{{$authors}}"
        ></carousel-component>
    </section>
@endsection
