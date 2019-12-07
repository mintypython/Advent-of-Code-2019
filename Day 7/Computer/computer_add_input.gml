///@function computer_add_input(computer, input)
///@arg computer
///@arg input
var computer = argument[0];
var input = computer[| COMPUTER.input];
for(var i = 1; i < argument_count; i++){
	ds_list_add(input, argument[i]);
}
