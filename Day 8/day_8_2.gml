//get input
var buff = buffer_load("input.txt");
var str = buffer_read(buff, buffer_text);
buffer_delete(buff);

var image_width = 25;
var image_height = 6;

var input_array = [];
for(var i = 1; i <= string_length(str); i++){
	if(string_char_at(str, i)!="\n" && string_char_at(str, i)!="\r")
	input_array[i-1] = real(string_char_at(str, i));
}

var layer_num = array_length_1d(input_array)/(image_width*image_height);

var layers = [];
for(var i = 0; i < layer_num; i++){
	var lay = [];
	for(var j = 0; j < image_width*image_height; j++){
		lay[j] = input_array[i*image_width*image_height+j];
	}
	layers[i] = lay;
}

var final_result = [];
for(var i = layer_num-1; i >=0; i--){
	var lay = layers[i];
	for(var j = 0; j <  image_width*image_height; j++){
		if(lay[j]!=2){
			final_result[j] = lay[j];
		}
	}
}

var final_str = "";
for(var i = 0; i < image_height; i++){
	for(var j = 0; j < image_width; j++){
		final_str += string(final_result[i*image_width+j]);
	}
	final_str += "\n";
}

return final_str;