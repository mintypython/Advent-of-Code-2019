var buff = buffer_load("input.txt");
var str = buffer_read(buff,buffer_text);
buffer_delete(buff);

var memory = string_split(str,",",true);

var game = computer_create(memory, INPUT.keyboard);
computer_set_output(game, OUTPUT.script, draw_brick_breaker);
var grid = ds_grid_create(50,50);
computer_set_temp(game, [grid, ds_list_create()]);

while(computer_step(game)){}

var blocks = 0;
for(var i = 0; i < 50; i++){
	for(var j = 0; j < 50; j++){
		if(grid[# i, j] == 2) blocks++;
	}
}

return blocks;