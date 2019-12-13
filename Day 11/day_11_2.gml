var buff = buffer_load("input.txt");
var str = buffer_read(buff,buffer_text);
buffer_delete(buff);

var memory = string_split(str,",",true);

var robot = computer_create(memory, INPUT.script, find_current_panel);
computer_set_output(robot, OUTPUT.script, paint_current_panel);

var grid = ds_grid_create(100,100);
grid[# 50,50] = 1;
var posX = 50;
var posY = 50;
var dir = 1;
var instruction = 0;

computer_set_temp(robot, [grid, posX, posY, dir, instruction, ds_list_create()]);

while(computer_step(robot)){}

var surface = surface_create(100,100);
surface_set_target(surface);
for(var i = 0; i < 100; i++){
	for(var j = 0; j < 100; j++){
		draw_set_color(grid[# i, j]==0?c_black : c_white);
		draw_point(i,j);
	}
}
surface_reset_target();

var inst = instance_create_depth(0,0,0,obj_draw_surface);
inst.surf = surface;

return "noshow";