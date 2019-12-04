instance_destroy(par_addon);
var day = get_string("What Advent Day script would you like to run?","");
var half = show_question("Yes for first half, no for second half")==0?2:1;
var script = asset_get_index("day_"+day+"_"+string(half));
if(script_exists(script)){
	var res = script_execute(script);
	if(res != "noshow")
		show_message(res);
}
else{
	show_message("No script for that day!");
}