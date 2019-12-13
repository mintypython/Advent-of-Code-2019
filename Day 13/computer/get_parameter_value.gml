///@function get_parameter_value(computer, parameter, ?default)
///@arg computer
///@arg parameter
///@arg ?default
var computer = argument[0];
var parameter = argument[1];
var memory = computer[| COMPUTER.memory];
var num = memory[computer[| COMPUTER.position]+parameter];
var mode = string_length(computer[| COMPUTER.parameter_modes])<parameter? 0 : real(string_char_at(computer[| COMPUTER.parameter_modes],string_length(computer[| COMPUTER.parameter_modes])-(parameter-1)));
if(argument_count>2) mode = argument[2];

switch(mode){
	//0 - position mode
	case 0:
		return num<array_length_1d(memory)?memory[num]: 0;
	//1 - immediate mode
	case 1:
		return num;
	
	//2 - relative mode
	case 2: 
		return memory[computer[| COMPUTER.relative_base] + num];
}