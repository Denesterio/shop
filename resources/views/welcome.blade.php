@extends('layouts.app')

@section('content')
                <div class="row">
                    <aside class="col-md-4">
                        <left-menu-component
                            :categories='{{$categories}}'
                            :subcategories='{{$subcategories}}'
                        ></left-menu-component>
                    </aside>
                    <div class="col-md-8">
                        <welcome-category-list-component
                            :categories='{{$categories}}'
                        ></welcome-category-list-component>
                    </div>
                </div>
@endsection
