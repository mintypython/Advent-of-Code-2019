///@function get_parameter_value(parameter_modes, memory, position, parameter)
///@arg memory
///@arg position
///@arg parameter
var parameter_modes = argument0;
var memory = argument1;
var position = argument2;
var parameter = argument3;

var num = memory[position+parameter];
var mode = string_length(parameter_modes)<parameter? 0: real(string_char_at(parameter_modes,string_length(parameter_modes)-(parameter-1)));

switch(mode){
	//0 - position mode
	case 0:
		return memory[num];
	//1 - immediate mode
	case 1:
		return num;
}