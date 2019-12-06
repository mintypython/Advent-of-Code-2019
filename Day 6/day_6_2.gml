var directs = ds_map_create();

var f = file_text_open_read("input.txt");
while(!file_text_eof(f)){
	var pair = string_split(file_text_read_string(f), ")");
	ds_map_add(directs, pair[1], pair[0]);
	file_text_readln(f);
}
file_text_close(f);

//find path from you 
var you_path = ds_list_create();
var current_orbit = "YOU";
while(ds_map_exists(directs,current_orbit)){
	ds_list_add(you_path,directs[? current_orbit]);
	current_orbit = directs[? current_orbit];
}

//find path from san
var san_path = ds_list_create();
var current_orbit = "SAN";
while(ds_map_exists(directs,current_orbit)){
	ds_list_add(san_path,directs[? current_orbit]);
	current_orbit = directs[? current_orbit];
}

//find closest path
for(var i = 0; i < ds_list_size(you_path); i++){
	var san_index = ds_list_find_index(san_path,you_path[| i]);
	if(san_index != -1){
		var you_path_intersect = i;
		var san_path_intersect = san_index;
		break;
	}
}

ds_map_destroy(directs);

var total = you_path_intersect + san_path_intersect;

return total;