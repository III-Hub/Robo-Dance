<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Danceoff extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            
            'won' => $this->robot($this->won),
            'lost' => $this->robot($this->lost),
      ]; 
    }
}
