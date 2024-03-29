var minimum = 402328;
var maximum = 864247;

var total = 0;
for(var i = minimum; i < maximum; i++){
	var str = string(i);
	
	//criteria 1: adjacent digits
	var adj = false;
	
	//criteria 2: no decrease
	var num = real(string_char_at(str,1));
	
	for(var j = 1; j <= string_length(str); j++){
		var current_digit = string_char_at(str,j);
		if(real(current_digit)<num){
			adj = false;
			break;
		}
		
		num = real(current_digit);
		
		if(current_digit == string_char_at(str,j+1)){
			j++;
			adj = true;
		}
	}
	
	if(adj)
		total++;
}

return total;