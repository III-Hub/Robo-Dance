<?php

namespace App\Http\Controllers;

use App\Season;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SeasonsController extends Controller
{
   
    public function store(Request $request)
    {
        $active_season = Season::where('active',1)->first();
        if($active_season){
            $active_season->active = 0;
            $active_season->save();
        }
        $season = New Season;
        $season->active = 1;
        $season->save();
        return response([], Response::HTTP_CREATED);
    }

}
