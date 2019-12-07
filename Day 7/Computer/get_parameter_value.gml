///@function get_parameter_value(parameter_modes, memory, position, parameter)
///@arg memory
///@arg position
///@arg parameter
var computer = argument0;
var parameter = argument1;

var memory = computer[| COMPUTER.memory];
var num = memory[computer[| COMPUTER.position]+parameter];
var mode = string_length(computer[| COMPUTER.parameter_modes])<parameter? 0: real(string_char_at(computer[| COMPUTER.parameter_modes],string_length(computer[| COMPUTER.parameter_modes])-(parameter-1)));

switch(mode){
	//0 - position mode
	case 0:
		return memory[num];
	//1 - immediate mode
	case 1:
		return num;
}