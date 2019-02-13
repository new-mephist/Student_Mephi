<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Teachers;

class TeachController extends Controller {
	public function show() {
		$teachers = Teachers::get();
		return view('teachers', compact('teachers'));
	}
}