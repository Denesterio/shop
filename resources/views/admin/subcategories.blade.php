@extends('layouts.app')

@section('content')
        <subcategories-component
            title='Список подкатегорий'
            :subcategories='{{$subcategories}}'
            :categories='{{$categories}}'

        />
@endsection