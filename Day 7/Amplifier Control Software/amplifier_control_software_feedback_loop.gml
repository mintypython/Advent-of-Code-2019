var memory = argument0;
var sequence_list = argument1;

var ampA = computer_create(memory, INPUT.list, sequence_list[| 0], 0);
var ampB = computer_create(memory, INPUT.list, sequence_list[| 1]);
var ampC = computer_create(memory, INPUT.list, sequence_list[| 2]);
var ampD = computer_create(memory, INPUT.list, sequence_list[| 3]);
var ampE = computer_create(memory, INPUT.list, sequence_list[| 4]);

computer_set_output(ampA, OUTPUT.computer, ampB);
computer_set_output(ampB, OUTPUT.computer, ampC);
computer_set_output(ampC, OUTPUT.computer, ampD);
computer_set_output(ampD, OUTPUT.computer, ampE);
computer_set_output(ampE, OUTPUT.computer, ampA);

var e_running = true;

while(e_running){
					computer_step(ampA);
					computer_step(ampB);
					computer_step(ampC);
					computer_step(ampD);
	e_running =		computer_step(ampE);
}

return ampE[| COMPUTER.output];