var buff = buffer_load("input.txt");
var str = buffer_read(buff,buffer_text);
buffer_delete(buff);

var memory = string_split(str,",",true);
memory[0] = 2;

var game = computer_create(memory, INPUT.script, brick_breaker_input);
computer_set_output(game, OUTPUT.script, brick_breaker_draw);
var grid = ds_grid_create(50,50);
computer_set_temp(game, [grid, ds_list_create()]);

global.paddle_x = 0;
global.paddle_y = 0;

var inst = instance_create_depth(0,0,0,obj_brick_breaker);
inst.game = game;

return "noshow";