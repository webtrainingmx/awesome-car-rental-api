@extends('layouts.app')
@section('content')

    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h1>My rentals</h1>
                @foreach($user->vehicles as $vehicle)
                    <div class="row">
                        <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                            <img src="/images/vehicles/{{$vehicle->thumbnail}}" alt=""
                                 class="img-thumbnail img-responsive">
                        </div>
                        <div class="col-xs-12 col-sm-7 col-md-8 col-lg-8">
                            {{ $vehicle->manufacturer->name }} {{ $vehicle->model }}
                            <p>
                                <strong>Starts on: </strong> <span>{{ $vehicle->pivot->starts_on }}</span>
                                <br>
                                <strong>Ends on: </strong> <span>{{ $vehicle->pivot->ends_on }}</span>
                            </p>
                        </div>
                    </div>

                @endforeach
            </div>
        </div>
    </div>

@endsection