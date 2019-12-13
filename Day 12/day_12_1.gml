var moons = [
	[-17,9,-5,0,0,0],
	[-1,7,13,0,0,0],
	[-19,12,5,0,0,0],
	[-6,-6,-4,0,0,0]
]

var len = array_length_1d(moons);
repeat(1000){
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
}

var total_energy = 0;
for(var i = 0; i < len; i++){
	var moon = moons[i];
	//calculate potential energy
	var potential = abs(moon[0])+abs(moon[1])+abs(moon[2]);
	//calculate kinetic energy
	var kinetic = abs(moon[3])+abs(moon[4])+abs(moon[5]);
	
	total_energy += potential * kinetic;
}

return total_energy;