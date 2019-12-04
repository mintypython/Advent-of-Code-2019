//get input
var buff = buffer_load("day_2.txt");
var str = buffer_read(buff, buffer_text);
buffer_delete(buff);

var arr = string_split(str,",");
arr[1] = "12";
arr[2] = "2";

for(var i = 0; i < array_length_1d(arr); i += 4){
	switch(real(arr[i])){
		case 1:
			arr[real(arr[i+3])] = real(arr[real(arr[i+1])])+real(arr[real(arr[i+2])]);
			break;
		case 2:
			arr[real(arr[i+3])] = real(arr[real(arr[i+1])])*real(arr[real(arr[i+2])]);
			break;
		case 99:
			return arr;
		default:
			show_error("um",true);
	}
}