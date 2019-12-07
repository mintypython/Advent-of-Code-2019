///@function new_computer(memory, input_type, output_type, ouput, ?initial_input)
///@arg memory
///@arg input_type
///@arg output_type
///@arg output
///@arg initial_input
enum COMPUTER {
	active,
	memory,
	input_mode,
	output_mode,
	output_destination,
	input,
	output,
	position,
	parameter_modes
}

enum INPUT {
	keyboard,
	list
}

enum OUTPUT {
	message,
	computer,
	none,
}

var computer = ds_list_create();
computer[| COMPUTER.active] = true;
computer[| COMPUTER.memory] = [];
array_copy(computer[| COMPUTER.memory], 0, argument[0], 0, array_length_1d(argument[0]));
computer[| COMPUTER.input_mode] = argument[1];
computer[| COMPUTER.output_mode] = OUTPUT.message;
computer[| COMPUTER.output_destination] = -1;
computer[| COMPUTER.input] = ds_list_create();
for(var i = 2; i < argument_count; i++){
	ds_list_add(computer[| COMPUTER.input], argument[i]);
}
ds_list_mark_as_list(computer, COMPUTER.input);
computer[| COMPUTER.output] = 0;
computer[| COMPUTER.position] = 0;
computer[| COMPUTER.parameter_modes] = "";
return computer;
