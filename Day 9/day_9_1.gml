var buff = buffer_load("input.txt");
var str = buffer_read(buff, buffer_text);
buffer_delete(buff);

var memory = string_split(str,",",true);

var comp = computer_create(memory, INPUT.keyboard);

while(computer_step(comp)){}

return comp[| COMPUTER.output];