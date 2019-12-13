///@function gcd(num1, num2)
var orig_num1 = max(abs(argument0),abs(argument1));
var orig_num2 = min(abs(argument0),abs(argument1));
var num1 = orig_num1;
var num2 = orig_num2;
while(num1 != num2){
	if(num1<=0) return orig_num2;
	if(num2<=0) return orig_num1;

    var remainder = num1-num2;
    num1 = num2;
    num2 = remainder
}
return num1;