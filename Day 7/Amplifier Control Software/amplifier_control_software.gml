var memory = argument0;
var sequence_list = argument1;
var ampA = computer_create(memory, INPUT.list, sequence_list[| 0], 0);
var ampB = computer_create(memory, INPUT.list, sequence_list[| 1]);
var ampC = computer_create(memory, INPUT.list, sequence_list[| 2]);
var ampD = computer_create(memory, INPUT.list, sequence_list[| 3]);
var ampE = computer_create(memory, INPUT.list, sequence_list[| 4]);

while(computer_step(ampA)){}
var res = ampA[| COMPUTER.output];
computer_add_input(ampB, res);

while(computer_step(ampB)){}
var res = ampB[| COMPUTER.output];
computer_add_input(ampC, res);

while(computer_step(ampC)){}
var res = ampC[| COMPUTER.output];
computer_add_input(ampD, res);

while(computer_step(ampD)){}
var res = ampD[| COMPUTER.output];
computer_add_input(ampE, res);

while(computer_step(ampE)){}
var res = ampE[| COMPUTER.output];

return res;
