@extends('layouts.app')

@section('head')
@endsection

@section('content')
    <div class="card">
        <div class="card-header">Dashboard</div>

        <div class="card-body">
            @if (session('status'))
                <div class="alert alert-success" role="alert">
                    {{ session('status') }}
                </div>
            @endif

            You are logged in!
        </div>
    </div>
	<h1>Это главная страница Mephist 2.0</h1>
@endsection

@section('js')
@endsection