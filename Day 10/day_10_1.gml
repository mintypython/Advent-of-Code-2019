var buff = buffer_load("input.txt");
var str = buffer_read(buff, buffer_text);
buffer_delete(buff);

var w = string_pos("\n",str)-2;
var h = string_count("\n",str);

var grid = ds_grid_create(w,h);

var i = 0, j = 1;
while(j <= string_length(str)){
	var char = string_char_at(str, j);
	if(char != "\n" && char != "\r"){
		grid[# i % w, i div w] = char;
		i++;
	}
	j++;
		
}

for(var i = 0; i < w; i++){
	for(var j = 0; j < h; j++){
		if(grid[# i, j] == ".") continue;
		
		var asteroids = 0;
		for(var k = 0; k < w; k++){
			for(var l = 0; l < h; l++){
				if(grid[# k, l] == "." || (k==i && l==j)) continue;
				
				var xstep = k - i;
				var ystep = l - j;
				
				var divisor = gcd(xstep, ystep);
				
				xstep /= divisor;
				ystep /= divisor;
				
				var fail = false;
				for(var m = 1; m < divisor; m++){
					if(frac(i + xstep*m)!=0||frac(j + ystep*m)!=0) continue;
					if(grid[# i + xstep*m, j + ystep*m] != "."){
						fail = true;
					}
				}
				
				if(!fail){
					asteroids++;
				}
			}
		}
		grid[# i, j] = asteroids;

	}
}

var most = 0;
var max_x = 0;
var max_y = 0;
for(var i = 0; i < w; i++){
	for(var j = 0; j < h; j++){
		if(grid[# i, j]==".") continue;
		if(grid[# i, j] > most){
			max_x = i;
			max_y = j;
			most = grid[# i, j];
		}
	}
}

return "BEST AT "+string(max_x)+","+string(max_y);