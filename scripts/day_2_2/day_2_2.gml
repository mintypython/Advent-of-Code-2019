//get input
var buff = buffer_load("day_2.txt");
var str = buffer_read(buff, buffer_text);
buffer_delete(buff);

//set goal
var desired_output = 19690720;

var original_arr = string_split(str,",");

for(var first = 0; first < 99; first++){
	for(var second = 0; second < 99; second++){
		var arr = original_arr;
		arr[1] = first;
		arr[2] = second;
		for(var i = 0; i < array_length_1d(arr); i += 4){
			switch(real(arr[i])){
				case 1:
					arr[real(arr[i+3])] = real(arr[real(arr[i+1])])+real(arr[real(arr[i+2])]);
					break;
				case 2:
					arr[real(arr[i+3])] = real(arr[real(arr[i+1])])*real(arr[real(arr[i+2])]);
					break;
				case 99:
					if(arr[0] == desired_output)
					return string(first)+string(second);
			}
		}
	}
}

return "No solution found.";