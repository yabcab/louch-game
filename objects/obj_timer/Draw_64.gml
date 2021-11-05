var str = ""
var range = random_range(-2,2)
if minutes > -1
{
	if seconds > 9
	{
		str = string(minutes) + ":" + string(seconds)
		//draw_text_transformed_color((640 - (string_width(str) / 2)) + range + 2,y + 2,str,2,2,0,col_3,col_3,col_3,col_3,1)
		//draw_text_transformed_color((640 - (string_width(str) / 2)) + range,y,str,2,2,0,col_1,col_1,col_2,col_2,1)
	}
	else
	{
		str = string(minutes) + ":0" + string(seconds)
		//draw_text_transformed_color((640 - (string_width(str) / 2)) + range + 2,y + 2,str,2,2,0,col_3,col_3,col_3,col_3,1)
		//draw_text_transformed_color((640 - (string_width(str) / 2)) + range,y,str,2,2,0,col_1,col_1,col_2,col_2,1)
	}
}
else
	instance_destroy()

draw_set_font(score_font)
draw_sprite_ext(sprite_index,image_index,525 - (string_width(str) / 2) + range,80,2 * image_xscale,2 * image_yscale,0,c_white,1)
draw_text_transformed_color((572 - (string_width(str) / 2)) + range,12,str,2,2,0,col_3,col_3,col_3,col_3,1)
draw_text_transformed_color((570 - (string_width(str) / 2)) + range,10,str,2,2,0,col_1,col_1,col_2,col_2,1)
draw_sprite_ext(sprite_index,image_index,700 + (string_width(str) / 2) + range,80,2 * image_xscale,2 * image_yscale,0,c_white,1)
draw_set_font(fnt_text)