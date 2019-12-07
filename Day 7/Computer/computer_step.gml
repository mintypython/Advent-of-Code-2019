///@function compute(computer)
///@arg computer
var computer = argument[0];
if(!computer[| COMPUTER.active]) return false;

var memory = computer[| COMPUTER.memory];
if(computer[| COMPUTER.position] < array_length_1d(memory)){
	var opcode = memory[computer[| COMPUTER.position]];
	var instruction = opcode%100;
	computer[| COMPUTER.parameter_modes] = string((opcode-instruction)/100);

	switch(instruction){
		//addition
		case 1:
			var param1 = get_parameter_value(computer, 1);
			var param2 = get_parameter_value(computer, 2);
			var param3 = memory[computer[| COMPUTER.position]+3];
			memory[@ param3] = param1+param2;
			computer[| COMPUTER.position]+=4;
			break;

		//multiplication
		case 2:
			var param1 = get_parameter_value(computer, 1);
			var param2 = get_parameter_value(computer, 2);
			var param3 = memory[computer[| COMPUTER.position]+3];
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
			}
			var param1 = memory[computer[| COMPUTER.position]+1];
			memory[@ param1] = input;
			computer[| COMPUTER.position]+=2;
			break;

		//output
		case 4:
			var output = memory[memory[computer[| COMPUTER.position]+1]];
			computer[| COMPUTER.output] = output;
			computer[| COMPUTER.position]+=2;
			switch(computer[| COMPUTER.output_mode]){
				case OUTPUT.message:
					show_debug_message(output);
					break;
				case OUTPUT.computer:
					computer_add_input(computer[| COMPUTER.output_destination], output);
					break;
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
			var param3 = memory[computer[| COMPUTER.position]+3];

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
			var param3 = memory[computer[| COMPUTER.position]+3];

			if(param1==param2){
				memory[@ param3] = 1;
			}
			else{
				memory[@ param3] = 0;
			}
			computer[| COMPUTER.position]+=4;
			break;

		//end
		case 99:
			computer[| COMPUTER.active] = false;
			return false;

		//error
		default:
			show_error("ERROR!  No command found for instruction "+string(instruction),true);
			exit;
	}
}
return true;
