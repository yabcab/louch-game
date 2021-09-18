
function draw_text_with_wave(_x,_y,str,vert,stretch,intensity,drag,time){
var spot = 0
var str_l = string_length(str)
var xx = 0
for (spot = 1; spot < str_l + 1; spot++)
{
	var wave = sin((time + spot) / drag) * intensity
	var char = string_copy(str,spot,1)
	draw_text(_x + xx + (wave * stretch),_y + (wave * vert),char)
	xx += string_width(char)
}

}