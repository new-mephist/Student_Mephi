<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/', 'HomeController@index');

Auth::routes();

Route::get('/in_development', function () {
    return view('in_development');
})->name('IN_DEVELOPMENT');

Route::get('/no_access', function () {
    return view('no_access');
})->name('NO_ACCESS');

Route::prefix('teachers')->group(function() {
	Route::middleware(['auth'])->group(function () {
		
	});
	
	Route::middleware(['auth', 'admin'])->group(function () {
		Route::get( '/', ['as' => 'Teach_show', 'uses' => 'TeachController@show']  );
	});
});

Route::prefix('materials')->group(function() {
	Route::middleware(['auth'])->group(function () {
		
	});
	Route::middleware(['auth', 'admin'])->group(function () {
		
	});
});

Route::prefix('forum')->group(function() {
	Route::middleware(['auth'])->group(function () {
		
	});
	Route::middleware(['auth', 'admin'])->group(function () {
		
	});
});
