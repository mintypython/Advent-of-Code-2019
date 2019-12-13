///@function compute(computer)
///@arg computer
var computer = argument[0];
if(!computer[| COMPUTER.active]) {
	return false;
}

var memory = computer[| COMPUTER.memory];
while(computer[| COMPUTER.position] < array_length_1d(memory)){
	var opcode = memory[computer[| COMPUTER.position]];
	var instruction = opcode%100;
	computer[| COMPUTER.parameter_modes] = string((opcode-instruction)/100);

	switch(instruction){
		//addition
		case 1:
			var param1 = get_parameter_value(computer, 1);
			var param2 = get_parameter_value(computer, 2);
			var param3 = get_parameter_value(computer, 3, 1)+get_relative_base(computer, 3);
			memory[@ param3] = param1+param2;
			computer[| COMPUTER.position]+=4;
			break;
			
		//multiplication
		case 2:
			var param1 = get_parameter_value(computer, 1);
			var param2 = get_parameter_value(computer, 2);
			var param3 = get_parameter_value(computer, 3, 1)+get_relative_base(computer, 3);
			memory[@ param3] = param1*param2;
			computer[| COMPUTER.position]+=4;
			break;
			
		//input
		case 3:
			var input;
			switch(computer[| COMPUTER.input_mode]){
				case INPUT.keyboard:
					input = real(get_string("Please enter a number",""));
					break;
				case INPUT.list:
					if(ds_list_empty(computer[| COMPUTER.input])) return true;
					input = ds_list_find_value(computer[| COMPUTER.input],0);
					ds_list_delete(computer[| COMPUTER.input],0);
					break;
				case INPUT.script:
					input = script_execute(ds_list_find_value(computer[| COMPUTER.input],0),computer);
					break;
			}
			var param1 = get_parameter_value(computer, 1, 1)+get_relative_base(computer, 1);
			memory[@ param1] = input;
			computer[| COMPUTER.position]+=2;
			break;
			
		//output
		case 4:
			var output = get_parameter_value(computer, 1);
			computer[| COMPUTER.position]+=2;
			switch(computer[| COMPUTER.output_mode]){
				case OUTPUT.message:
					computer[| COMPUTER.output] = output;
					show_debug_message(output);
					break;
				case OUTPUT.computer:
					computer_add_input(computer[| COMPUTER.output_destination], output);
					break;
				case OUTPUT.script:
					script_execute(computer[| COMPUTER.output_destination], computer, output);
					break;
			}
			if(computer[| COMPUTER.jump_out]){
				computer[| COMPUTER.jump_out] = false;
				return true;
			}
			break;

		//jump-if-true
		case 5:
			var param1 = get_parameter_value(computer, 1);
			var param2 = get_parameter_value(computer, 2);
			if(param1!=0){
				computer[| COMPUTER.position] = param2;
			}
			else{
				computer[| COMPUTER.position]+=3;
			}
			break;
		
		//jump-if-false
		case 6:
			var param1 = get_parameter_value(computer, 1);
			var param2 = get_parameter_value(computer, 2);
			if(param1==0){
				computer[| COMPUTER.position] = param2;
			}
			else{
				computer[| COMPUTER.position]+=3;
			}
			break;
			
		//less than
		case 7:
			var param1 = get_parameter_value(computer, 1);
			var param2 = get_parameter_value(computer, 2);
			var param3 = get_parameter_value(computer, 3, 1)+get_relative_base(computer, 3);

			if(param1<param2){
				memory[@ param3] = 1;
			}
			else{
				memory[@ param3] = 0;
			}
			computer[| COMPUTER.position]+=4;
			break;
		
		//equal
		case 8:
			var param1 = get_parameter_value(computer, 1);
			var param2 = get_parameter_value(computer, 2);
			var param3 = get_parameter_value(computer, 3, 1)+get_relative_base(computer, 3);

			if(param1==param2){
				memory[@ param3] = 1;
			}
			else{
				memory[@ param3] = 0;
			}
			computer[| COMPUTER.position]+=4;
			break;
		
		//move relative base
		case 9:
			computer[| COMPUTER.relative_base] += get_parameter_value(computer, 1);
			computer[| COMPUTER.position]+=2;
			break;
		//end
		case 99:
			computer[| COMPUTER.active] = false;
			return false;
		
		//error
		default:
			show_error("ERROR!  No command found for instruction "+string(instruction),true);
			return false;
	}
}
return true;