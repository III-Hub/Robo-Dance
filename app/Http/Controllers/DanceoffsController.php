<?php

namespace App\Http\Controllers;

use App\Danceoff;
use App\Season;
use App\Robot;
use App\Http\Resources\Danceoff as DanceoffResource;
use App\Http\Resources\Board as BoardResource;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class DanceoffsController extends Controller
{
    
    private $active_season_id = false;

    public function index()
    {
        $danceoffs = Danceoff::where('season_id', $this->activeSeason()->id)->get();
        return DanceoffResource::collection($danceoffs);
    }


    public function leaderboard()
    {
        $items = Robot::all()->sortByDesc('wins'); 
        return BoardResource::collection($items);
    }

    
    public function store(Request $request)
    {
        if($request['won_id'] == $request['lost_id']){
            return response(['Error' => 'Robot can not compete agaist itself'], Response::HTTP_BAD_REQUEST);
        }
        
        $active_season = $this->activeSeason();

        if(!$active_season){
            return response(['Error' => 'No open danceoff season available'], Response::HTTP_BAD_REQUEST);
        }

        $this->active_season_id = $active_season->id;

        $won = Robot::find($request['won_id']);
        $lost = Robot::find($request['lost_id']);
        
        if(!$won || !$lost){
            return response(['Error' => 'One or both the ids are incorect'], Response::HTTP_BAD_REQUEST);
        }

        if($won->team == $lost->team){
            return response(['Error' => 'No danceoff between members of same team'], Response::HTTP_BAD_REQUEST);
        }

        if($this->checkTeamPlayed($won->id, $lost->id) || $this->checkTeamPlayed($lost->id, $won->id)){
            return response(['Error' => 'At least one robot has already competed against the other robot team member'], Response::HTTP_BAD_REQUEST);
        }

        $danceoff = Danceoff::create([
                                       'season_id' => $this->active_season_id, 
                                       'won' => $won->id,
                                       'lost' => $lost->id
                                       ]);

        return (new DanceoffResource($danceoff))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);
    }


    private function activeSeason()
    {
        return Season::where('active',1)->first();
    }
    

    private function checkSeasonPlayed($robot_id)
    {
        return Danceoff::where([
                                 ['won', $robot_id],
                                 ['season_id', $this->active_season_id],
                                 ])->orWhere([
                                  ['lost', $robot_id],
                                  ['season_id', $this->active_season_id],
                                 ])->first(); 
    }

    private function checkGamePlayed($robot1_id, $robot2_id)
    {
        return Danceoff::where([
                                 ['won', $robot1_id],
                                 ['lost', $robot2_id],
                                 ['season_id', $this->active_season_id],
                                 ])->orWhere([
                                  ['won', $robot2_id],
                                  ['lost', $robot1_id],
                                  ['season_id', $this->active_season_id],
                                 ])->first(); 
    }

    private function checkTeamPlayed($robot1_id, $robot2_id)
    {
        $robot2 = Robot::find($robot2_id);
        $danceoffs = Danceoff::where([
                                 ['won', $robot1_id],
                                 ['season_id', $this->active_season_id],
                                 ])->orWhere([
                                  ['lost', $robot1_id],
                                  ['season_id', $this->active_season_id],
                                 ])->get(); 
                        
        foreach($danceoffs as $danceoff){
            if($danceoff->getRobot($danceoff->won)->team == $robot2->team || $danceoff->getRobot($danceoff->lost)->team == $robot2->team){
                return TRUE;
            }
        }

        return FALSE; 
    }
}
