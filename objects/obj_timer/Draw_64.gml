if minutes > -1
{
	var range = random_range(-2,2)
	if seconds > 9
	{
		draw_text_transformed_color(x + range + 2,y + 2,string(minutes) + ":" + string(seconds),2,2,0,col_3,col_3,col_3,col_3,1)
		draw_text_transformed_color(x + range,y,string(minutes) + ":" + string(seconds),2,2,0,col_1,col_1,col_2,col_2,1)
	}
	else
	{
		draw_text_transformed_color(x + range + 2,y + 2,string(minutes) + ":0" + string(seconds),2,2,0,col_3,col_3,col_3,col_3,1)
		draw_text_transformed_color(x + range,y,string(minutes) + ":0" + string(seconds),2,2,0,col_1,col_1,col_2,col_2,1)
	}
}
else
	instance_destroy()