<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Manufacturer extends Model
{
    public function cars()
    {
        return $this->hasMany('App\Car');
    }
}
