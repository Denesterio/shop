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
            <category-list-component
                :categories='{{$categories}}'
            ></category-list-component>
        </main>
    </div>
@endsection
