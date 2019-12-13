computer_step(game);
if(!surface_exists(surf)){
	surf = surface_create(50,50);
}
score = game[| COMPUTER.output];
var temp = game[| COMPUTER.temp];
var grid = temp[0];

surface_set_target(surf);
draw_clear_alpha(c_black,1);
for(var i = 0; i < 50; i++){
	for(var j = 0; j < 50; j++){
		switch(grid[# i, j]){
			case 0:
				draw_set_color(c_black);
				break;
			case 1:
				draw_set_color(c_dkgray);
				break;
			case 2:
				draw_set_color(c_gray);
				break;
			case 3:
				draw_set_color(c_red);
				break;
			case 4:
				draw_set_color(c_green);
				break;
		}
		draw_point(i,j);
	}
}
surface_reset_target();
alarm[0] = 1;