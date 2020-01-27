<?php

namespace App\Http\Controllers;

use App\Team;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class TeamsController extends Controller
{
    
    public function store(Request $request)
    {
        $team = New Team;
        $team->save();
        return response([], Response::HTTP_CREATED);
    }

}
