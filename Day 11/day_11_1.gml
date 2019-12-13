var buff = buffer_load("input.txt");
var str = buffer_read(buff,buffer_text);
buffer_delete(buff);

var memory = string_split(str,",",true);

var robot = computer_create(memory, INPUT.script, find_current_panel);
computer_set_output(robot, OUTPUT.script, paint_current_panel);

var grid = ds_grid_create(100,100);
var posX = 50;
var posY = 50;
var dir = 1;
var instruction = 0;

computer_set_temp(robot, [grid, posX, posY, dir, instruction, ds_list_create()]);

while(computer_step(robot)){}

return robot[| COMPUTER.output];