//get input
var f = file_text_open_read("input.txt");

var total = 0;
while(!file_text_eof(f)){
	var num = real(file_text_readln(f));
	total += floor(num/3)-2;
}
file_text_close(f);

return total;