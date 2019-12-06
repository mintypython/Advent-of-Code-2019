var directs = ds_map_create();

var f = file_text_open_read("input.txt");
while(!file_text_eof(f)){
	var pair = string_split(file_text_read_string(f), ")");
	ds_map_add(directs, pair[1], pair[0]);
	file_text_readln(f);
}
file_text_close(f);

var total = 0;

for(var key = ds_map_find_first(directs); key != undefined; key = ds_map_find_next(directs, key)){
	var current_orbit = key;
	while(ds_map_exists(directs, current_orbit)){
		total++;
		current_orbit = directs[? current_orbit];
	}
}

ds_map_destroy(directs);

return total;