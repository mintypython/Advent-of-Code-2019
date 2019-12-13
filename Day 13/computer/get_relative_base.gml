///@function get_relative_base(computer, parameter)
///@arg computer
///@arg parameter
var computer = argument[0];
var parameter = argument[1];
var memory = computer[| COMPUTER.memory];
var num = memory[computer[| COMPUTER.position]+parameter];
var mode = string_length(computer[| COMPUTER.parameter_modes])<parameter? 0 : real(string_char_at(computer[| COMPUTER.parameter_modes],string_length(computer[| COMPUTER.parameter_modes])-(parameter-1)));

switch(mode){
	
	//2 - relative mode
	case 2: 
		return computer[| COMPUTER.relative_base];
		
	default:
		return 0;
}