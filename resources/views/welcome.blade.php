@extends('layouts.app')

@section('content')
                <div class="row">
                    <b-col cols="4">
                        <left-menu-component
                            :categories='{{$categories}}'
                            :subcategories='{{$subcategories}}'
                        ></left-menu-component>
                        </b-col>
                    <b-col cols="8">
                        <category-list-component
                            :categories='{{$categories}}'
                        ></category-list-component>
                    </b-col>
                </div>
@endsection
