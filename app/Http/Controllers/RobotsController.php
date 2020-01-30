<?php

namespace App\Http\Controllers;

use App\Robot;
use App\Team;
use App\Http\Resources\Robot as RobotResource;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class RobotsController extends Controller
{
    
    public function index()
    {
        $robots = Robot::all();
        return RobotResource::collection($robots);
    }


    public function store(Request $request)
    {
        $team = Team::all()->where('members', '<', 5)->first();
        
        if(!$team){
            $team = new Team;
            $team->save();
        }

        try {
            $robot = Robot::create($this->validateData());
        } catch (\Exception $e) {
            return response(['Error' => 'There was a problem with information provided'], Response::HTTP_BAD_REQUEST);
        }

        $team->members()->create([
            'robot_id' => $robot->id
        ]);
            
        return (new RobotResource($robot))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }


    public function show(Robot $robot)
    {
        return new RobotResource($robot);
    }
    

    private function validateData()
    {
        return request()->validate([
            'name' => 'required|unique:robots',
            'powermove' => 'required',
            'experience' => 'required|numeric',
            'outOfOrder' => 'required|boolean',
        ]);
    }
}
