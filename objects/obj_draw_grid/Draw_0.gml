x = room_width/2;
y = room_height/2;
var scale = 0.05;

if(ds_exists(red,ds_type_list)){
	draw_set_color(c_red);
	for(var i = 0; i < ds_list_size(red); i++){
		var line = red[| i];
		draw_line_width(x+line[0]*scale,y+line[1]*scale,x+line[2]*scale,y+line[3]*scale,4);
	}
}

if(ds_exists(green,ds_type_list)){
	draw_set_color(c_green);
	for(var i = 0; i < ds_list_size(green); i++){
		var line = green[| i];
		draw_line_width(x+line[0]*scale,y+line[1]*scale,x+line[2]*scale,y+line[3]*scale,4);
	}
}

if(ds_exists(intersections,ds_type_list)){
	draw_set_color(c_yellow);
	for(var i = 0; i < ds_list_size(intersections); i++){
		var intersection = intersections[| i];
		draw_circle(x+intersection[0]*scale,y+intersection[1]*scale,3,false);
	}
}