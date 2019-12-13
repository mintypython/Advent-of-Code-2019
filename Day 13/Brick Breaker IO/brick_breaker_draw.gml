var computer = argument0;
var output = argument1;
var temp = computer[| COMPUTER.temp];

var args = temp[1];

ds_list_add(args, output);

if(ds_list_size(args)==3){
	if(args[| 0] == -1 && args[| 1] == 0){
		var _score = args[| 2];
		computer[| COMPUTER.output] = _score;
	}
	else{
		var grid = temp[0];
		grid[# args[| 0], args[|1]] = args[| 2];
		if(args[| 2] == 3){
			global.paddle_x = args[| 0];
			global.paddle_y = args[| 1];
			computer[| COMPUTER.jump_out] = true;
		}
		else if(args[| 2] == 4){
			global.ball_x = args[| 0];
			global.ball_y = args[| 1];
		}
	}
	ds_list_clear(args);
}