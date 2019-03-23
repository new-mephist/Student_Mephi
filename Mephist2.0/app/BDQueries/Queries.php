<?php
/**
 * Created by PhpStorm.
 * User: nicko
 * Date: 18.03.2019
 * Time: 12:58
 */

namespace App\BDQueries;


use Illuminate\Support\Facades\DB;

class Queries{
   function __construct(){

   }

   static function teacherQuery (){
       $res = DB::select("SELECT * FROM teachers");
       return $res;
   }

   static function materialQuery (){
       $res = DB::select("SELECT * FROM materialы");
       return $res;
   }


}