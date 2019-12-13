///@function string_split(string, delimiter, real?, stretch?)
var str = argument[0];
var delimiter = argument[1];
var _real = argument_count>2?argument[2]: false;

var pos = string_pos(delimiter,str);
var arr = argument_count>3?array_create(30000,0): array_create(0);
var i = 0;
while(pos>0){
	arr[i++] = _real?real(string_copy(str,1,pos-1)): string_copy(str,1,pos-1);
	str = string_delete(str, 1, pos);
	pos = string_pos(delimiter,str);
}
if(string_length(str)>0){
	arr[i++] = _real?real(string_copy(str,1,string_length(str))): string_copy(str,1,string_length(str));
}
return arr;