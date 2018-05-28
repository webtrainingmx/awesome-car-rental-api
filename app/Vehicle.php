<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vehicle extends Model
{
    public function manufacturer()
    {
        return $this->belongsTo('App\Manufacturer');
    }

    public function users()
    {
        return $this->belongsToMany('App\User', 'user_vehicle')
            ->withPivot('starts_on', 'ends_on');
    }
}
