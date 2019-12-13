var computer = argument[0];
var output = argument[1];

var temp = computer[| COMPUTER.temp];

switch(temp[4]){
	//paint
	case 0:
		temp[@ 4] = 1;
		var grid = temp[0];
		grid[# temp[1], temp[2]] = output;
		if(ds_list_find_index(temp[5],temp[1]*1000+temp[2])==-1){
			ds_list_add(temp[5],temp[1]*1000+temp[2]);
			computer[| COMPUTER.output]++;
		}
		break;
	//move
	case 1:
		temp[@ 4] = 0;
		temp[@ 3] += output*2 - 1;
		temp[@ 1] += lengthdir_x(1, temp[@ 3]*90);
		temp[@ 2] += lengthdir_y(1, temp[@ 3]*90);
		break;
}