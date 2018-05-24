<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Manufacturer extends Model
{
    public function vehicles()
    {
        return $this->hasMany('App\Vehicle');
    }
}
