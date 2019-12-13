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

var layer_zero_count = [];
var layer_one_count = [];
var layer_two_count = [];

for(var i = 0; i < layer_num; i++){
	layer_zero_count[i] = 0;
	layer_one_count[i] = 0;
	layer_two_count[i] = 0;
	var zeroes = 0;
	for(var j = 0; j < image_width*image_height; j++){
		var num = input_array[i*image_width*image_height+j];
		switch(num){
			case 0:
				layer_zero_count[i]++;
				break;
			case 1:
				layer_one_count[i]++;
				break;
			case 2:
				layer_two_count[i]++;
				break;
		}
	}
}

var fewest_zeroes = 0;
var fewest_zero_count = infinity;
for(var i = 0; i < layer_num; i++){
	if(layer_zero_count[i] < fewest_zero_count){
		fewest_zeroes = i;
		fewest_zero_count = layer_zero_count[i];
	}
}

return layer_one_count[fewest_zeroes] * layer_two_count[fewest_zeroes];