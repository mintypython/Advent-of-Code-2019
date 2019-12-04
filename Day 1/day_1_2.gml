//get input
var f = file_text_open_read("input.txt");

var total = 0;
while(!file_text_eof(f)){
	var num = real(file_text_readln(f));
	var additional_fuel = floor(num/3)-2;
	while(additional_fuel > 0){
		total += additional_fuel;
		additional_fuel = floor(additional_fuel/3)-2;
	}
}
file_text_close(f);

return total;