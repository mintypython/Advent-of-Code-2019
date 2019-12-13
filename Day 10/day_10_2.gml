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

var outpostX = 20;
var outpostY = 19;

var asteroids = ds_map_create();
var angles = ds_list_create();
for(var posX = 0; posX < w; posX++){
	for(var posY = 0; posY < h; posY++){
		if(grid[# posX, posY] == ".") continue;
		if(posX == outpostX && posY == outpostY) continue;
		var ang = point_direction(outpostX, outpostY, posX, posY);
		var dist = point_distance(outpostX, outpostY, posX, posY);
		if(!ds_map_exists(angles, ang)){
			ds_map_add(angles, ang, ds_priority_create());
		}
		var pq = angles[? ang];
		ds_priority_add(pq, [posX,posY], dist);
		if(ds_list_find_index(angles, ang)==-1) ds_list_add(angles, ang);
	}
}

ds_list_sort(angles, false);

var pos = ds_list_find_index(angles, 90);

var i = 0;
while(i < 200){
	var ang = angles[| pos];
	var pq = asteroids[? ang];
	pos = (pos + 1) % ds_list_size(angles);
	if(ds_priority_empty(pq)){
		continue;
	}
	else{
		var vaporized = ds_priority_delete_min(pq);
		i++;
		show_debug_message("ASTEROID #"+string(i)+": at "+string(vaporized[0])+","+string(vaporized[1])+" at an angle of "+string(ang));
	}
}

return vaporized;