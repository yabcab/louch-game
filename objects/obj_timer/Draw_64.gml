if minutes > -1
{
	var range = random_range(-2,2)
	if seconds > 9
	{
		var str = string(minutes) + ":" + string(seconds)
		draw_text_transformed_color((640 - (string_width(str) / 2)) + range + 2,y + 2,str,2,2,0,col_3,col_3,col_3,col_3,1)
		draw_text_transformed_color((640 - (string_width(str) / 2)) + range,y,str,2,2,0,col_1,col_1,col_2,col_2,1)
	}
	else
	{
		var str = string(minutes) + ":0" + string(seconds)
		draw_text_transformed_color((640 - (string_width(str) / 2)) + range + 2,y + 2,str,2,2,0,col_3,col_3,col_3,col_3,1)
		draw_text_transformed_color((640 - (string_width(str) / 2)) + range,y,str,2,2,0,col_1,col_1,col_2,col_2,1)
	}
}
else
	instance_destroy()