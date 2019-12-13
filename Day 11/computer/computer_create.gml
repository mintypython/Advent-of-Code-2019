///@function new_computer(memory, input_type, ?initial_input)
///@arg memory
///@arg input_type
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
	parameter_modes,
	relative_base,
	temp,
	jump_out
}

enum INPUT {
	keyboard,
	list,
	script
}

enum OUTPUT {
	message,
	computer,
	script,
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
computer[| COMPUTER.relative_base] = 0;
computer[| COMPUTER.temp] = 0;
computer[| COMPUTER.jump_out] = false;
return computer;