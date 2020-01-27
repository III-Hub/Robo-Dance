<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Danceoff extends Model
{
    protected $guarded = [];

    public function season()
    {
        return $this->belongsTo(Season::class);  
    }

    public function robot($robot_id)
    {
        $robot = Robot::find($robot_id);
        return [
            'id' => $robot->id,
            'name' => $robot->name,
            'powermove' => $robot->powermove,
            'experience' => $robot->experience,
            'outOfOrder' => $robot->outOfOrder? true : false,
            'avatar' => $robot->avatar,
        ];
    }

    public function getRobot($robot_id)
    {
        return Robot::find($robot_id);
    }
}
