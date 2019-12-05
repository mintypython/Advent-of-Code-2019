//get input
var buff = buffer_load("input.txt");
var str = buffer_read(buff, buffer_text);
buffer_delete(buff);

var memory = string_split(str,",",true);

var position = 0;
while(position < array_length_1d(memory)){
	var opcode = memory[position];
	var instruction = opcode%100;
	var parameter_modes = string((opcode-instruction)/100);

	switch(instruction){
		//addition
		case 1:
			var param1 = get_parameter_value(parameter_modes, memory, position, 1);
			var param2 = get_parameter_value(parameter_modes, memory, position, 2);
			var param3 = memory[position+3];
			memory[param3] = param1+param2;
			position+=4;
			break;
			
		//multiplication
		case 2:
			var param1 = get_parameter_value(parameter_modes, memory, position, 1);
			var param2 = get_parameter_value(parameter_modes, memory, position, 2);
			var param3 = memory[position+3];
			memory[param3] = param1*param2;
			position+=4;
			break;
			
		//input
		case 3:
			var param1 = memory[position+1];
			var input = real(get_string("Please enter a number",""));
			memory[param1] = input;
			position+=2;
			break;
			
		//output
		case 4:
			var output = memory[memory[position+1]];
			show_debug_message(output);
			position+=2;
			break;
			
		//jump-if-true
		case 5:
			var param1 = get_parameter_value(parameter_modes, memory, position, 1);
			var param2 = get_parameter_value(parameter_modes, memory, position, 2);
			if(param1!=0){
				position = param2;
			}
			else{
				position+=3;
			}
			break;
		
		//jump-if-false
		case 6:
			var param1 = get_parameter_value(parameter_modes, memory, position, 1);
			var param2 = get_parameter_value(parameter_modes, memory, position, 2);
			if(param1==0){
				position = param2;
			}
			else{
				position+=3;
			}
			break;
			
		//less than
		case 7:
			var param1 = get_parameter_value(parameter_modes, memory, position, 1);
			var param2 = get_parameter_value(parameter_modes, memory, position, 2);
			var param3 = memory[position+3];

			if(param1<param2){
				memory[param3] = 1;
			}
			else{
				memory[param3] = 0;
			}
			position+=4;
			break;
		
		//equal
		case 8:
			var param1 = get_parameter_value(parameter_modes, memory, position, 1);
			var param2 = get_parameter_value(parameter_modes, memory, position, 2);
			var param3 = memory[position+3];

			if(param1==param2){
				memory[param3] = 1;
			}
			else{
				memory[param3] = 0;
			}
			position+=4;
			break;
		
		//end
		case 99:
			return memory;
		
		//error
		default:
			show_error("ERROR!  No command found.",true);
	}
}