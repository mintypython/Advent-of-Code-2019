var moons = [
	[-17,9,-5,0,0,0],
	[-1,7,13,0,0,0],
	[-19,12,5,0,0,0],
	[-6,-6,-4,0,0,0]
]

var len = array_length_1d(moons);

var states = ds_map_create();

while(true){
	//update velocity
	for(var i = 0; i < len; i++){
		var moon = moons[i];
		for(var j = 0; j < len; j++){
			var other_moon = moons[j];
			moon[@ 3] += sign(other_moon[0] - moon[0]);
			moon[@ 4] += sign(other_moon[1] - moon[1]);
			moon[@ 5] += sign(other_moon[2] - moon[2]);
		}
	}
	
	//update position
	for(var i = 0; i < len; i++){
		var moon = moons[i];
		moon[@ 0] += moon[ 3];
		moon[@ 1] += moon[ 4];
		moon[@ 2] += moon[ 5];
	}
	
	var state = "";
	for(var i = 0; i < len; i++){
		var moon = moons[i];
		state += "["+string(moon[0])+","+string(moon[1])+","+string(moon[2])+","+string(moon[3])+","+string(moon[4])+","+string(moon[5])+"]";
	}
	
	if(ds_map_exists(states, state)) break;
	ds_map_add(states, state, 0);
}

return ds_list_size(states);