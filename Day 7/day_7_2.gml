//get input
var buff = buffer_load("input.txt");
var str = buffer_read(buff, buffer_text);
buffer_delete(buff);

var memory = string_split(str,",",true);

var sequence_list = ds_list_create();
ds_list_add(sequence_list, 5, 6, 7, 8, 9);
var n = ds_list_size(sequence_list);
var c = [0,0,0,0,0];

var max_output = amplifier_control_software_feedback_loop(memory, sequence_list);

var i = 0;
while(i < n){
	if(c[i]<i){
		if(i%2==0){
			sequence_list[| 0] = sequence_list[| 0] + sequence_list[| i];
			sequence_list[| i] = sequence_list[| 0] - sequence_list[| i];
			sequence_list[| 0] = sequence_list[| 0] - sequence_list[| i];
		}
		else{
			sequence_list[| c[i]]	= sequence_list[| c[i]] + sequence_list[| i];
			sequence_list[| i]		= sequence_list[| c[i]] - sequence_list[| i];
			sequence_list[| c[i]]	= sequence_list[| c[i]] - sequence_list[| i];
		}
		
		max_output = max(max_output, amplifier_control_software_feedback_loop(memory, sequence_list));
		
		c[i] += 1
		
		i = 0;
	}
	else{
		c[i] = 0;
		i++;
	}
}

return max_output;