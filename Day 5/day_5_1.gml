//get input
var buff = buffer_load("input.txt");
var str = buffer_read(buff, buffer_text);
buffer_delete(buff);

var memory = string_split(str,",",true);

for(var position = 0; position < array_length_1d(memory); position++){
	var opcode = memory[position];
	var instruction = opcode%100;
	var parameter_modes = string((opcode-instruction)/100);
	
	show_debug_message("OPCODE: "+string(opcode)+", INSTRUCTION: "+string(instruction)+", PARAMETER MODES: "+string(parameter_modes));
	switch(instruction){
		//addition
		case 1:
			var param1 = get_parameter_value(parameter_modes, memory, position, 1);
			var param2 = get_parameter_value(parameter_modes, memory, position, 2);
			var param3 = memory[position+3];
			memory[param3] = param1+param2;
			position+=3;
			break;
			
		//multiplication
		case 2:
			var param1 = get_parameter_value(parameter_modes, memory, position, 1);
			var param2 = get_parameter_value(parameter_modes, memory, position, 2);
			var param3 = memory[position+3];
			memory[param3] = param1*param2;
			position+=3;
			break;
			
		//input
		case 3:
			var param1 = memory[position+1];
			var input = real(get_string("Please enter a number",""));
			memory[param1] = input;
			position++;
			break;
			
		//output
		case 4:
			var output = memory[memory[position+1]];
			show_debug_message(output);
			position++;
			break;
		
		//end
		case 99:
			return memory;
		
		//error
		default:
			show_error("ERROR!  No command found.",true);
	}
}