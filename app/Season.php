<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Season extends Model
{
    protected $guarded = [];

    public function danceoffs()
    {
        return $this->hasMany(Danceoff::class);
    }
}
