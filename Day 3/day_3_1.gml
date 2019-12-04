//get input
var f = file_text_open_read("day_3.txt");
var line1 = string_split(file_text_readln(f),",");
var line2 = string_split(file_text_readln(f),",");
file_text_close(f);

//populate wire 1
var line1_segments = ds_list_create();
var posX = 0;
var posY = 0;
for(var i = 0; i < array_length_1d(line1); i++){
	var command = line1[i];
	var dir;
	switch(string_char_at(command,1)){
		case "R":
			dir = 0;
			break;
		case "U":
			dir = 1;
			break;
		case "L":
			dir = 2;
			break;
		case "D":
			dir = 3;
			break;
	}
	var len = real(string_delete(command,1,1));
	var newPosX = posX + lengthdir_x(len, dir*90);
	var newPosY = posY + lengthdir_y(len, dir*90);
	ds_list_add(line1_segments,[posX,posY,newPosX,newPosY]);
	posX = newPosX;
	posY = newPosY;
}

//populate wire 2
var line2_segments = ds_list_create();
var posX = 0;
var posY = 0;
for(var i = 0; i < array_length_1d(line2); i++){
	var command = line2[i];
	var dir;
	switch(string_char_at(command,1)){
		case "R":
			dir = 0;
			break;
		case "U":
			dir = 1;
			break;
		case "L":
			dir = 2;
			break;
		case "D":
			dir = 3;
			break;
	}
	var len = real(string_delete(command,1,1));
	var newPosX = posX + lengthdir_x(len, dir*90);
	var newPosY = posY + lengthdir_y(len, dir*90);
	ds_list_add(line2_segments,[posX,posY,newPosX,newPosY]);
	posX = newPosX;
	posY = newPosY;
}

//find intersections
var smallest = infinity;
for(var i = 0; i < ds_list_size(line1_segments); i++){
	for(var j = 0; j < ds_list_size(line2_segments); j++){
		var segment1 = line1_segments[| i];
		var segment2 = line2_segments[| j];
		var ua = lines_intersect(segment1[0],segment1[1],segment1[2],segment1[3],segment2[0],segment2[1],segment2[2],segment2[3],true);
		if(ua != 0){
			var ix = lerp(segment1[0],segment1[2],ua);
			var iy = lerp(segment1[1],segment1[3],ua);
			if(abs(ix)+abs(iy)<smallest){
				smallest = abs(ix)+abs(iy);
			}
		}
	}
}

return smallest;