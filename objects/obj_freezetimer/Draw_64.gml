//var range = random_range(-2,2)
draw_set_color(c_white)
var str = ""
if minutes > -1
{
	if seconds > 9
	{
		var str = string(seconds)
	}
	else
	{
		var str = "0" + string(seconds)
	}
}
else
	instance_destroy()

var prev = draw_get_font()
draw_set_font(freezetimerfont)
draw_sprite_ext(spr_freezetimerbg,0,0,720,2,2,0,c_white,1)
draw_text_transformed(0,555,string(minutes),2,2,0)
draw_text_transformed(70,555,":",2,2,0)
draw_text_transformed(130,555,str,2,2,0)
draw_set_font(prev)