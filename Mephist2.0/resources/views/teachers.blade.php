@extends('layouts.app')

@section('head')
@endsection

@section('content')
	<h1>Наши преподаватели:</h1>
	<?php
		$j = 0;
		$len = count($teachers);
		while($j < $len) {
			$row = $teachers[$j++];
			print "Это ".$row["name"]." ---- ".$row["desc"]."<br>";
		}
	?>	
@endsection

@section('js')
@endsection