<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Robot extends Model
{
    protected $guarded = [];

    public function team()
    {
        return $this->belongsTo(TeamMember::class); 
    }

    public function getPathAttribute()
    {
        return '/robots/' . $this->id;
    }

    public function getAvatarAttribute()
    {
        return 'https://robohash.org/'.str_slug($this->name).'.png';
    }

    public function getTeamAttribute()
    {
        $tm= TeamMember::where('robot_id',$this->id)->first();
        return $tm->team_id;
    }

    public function getWinsAttribute()
    {
        return Danceoff::where('won', $this->id)->count();  
    }

    public function getLostsAttribute()
    {
        return Danceoff::where('lost', $this->id)->count();   
    }

    public function getPlayedAttribute()
    {
        return $this->getWinsAttribute() + $this->getLostsAttribute();   
    }
}
