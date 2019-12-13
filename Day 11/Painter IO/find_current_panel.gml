var computer = argument[0];
var temp = computer[| COMPUTER.temp];

var grid = temp[0];
var posX = temp[1];
var posY = temp[2];

return grid[# posX, posY];