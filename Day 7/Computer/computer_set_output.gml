///@function computer_set_output(computer, output_mode, output_destination)
///@arg computer
///@arg output_mode
///@arg ?output_destination
var computer = argument[0];
computer[| COMPUTER.output_mode] = argument[1];
if(argument_count>2){
	computer[| COMPUTER.output_destination] = argument[2];
}