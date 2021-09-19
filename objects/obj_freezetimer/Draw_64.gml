if minutes > -1
	if seconds > 9
		draw_text_transformed_color(x + random_range(-2,2),y,string(minutes) + ":" + string(seconds),2,2,0,col_1,col_1,col_2,col_2,1)
	else
		draw_text_transformed_color(x + random_range(-2,2),y,string(minutes) + ":0" + string(seconds),2,2,0,col_1,col_1,col_2,col_2,1)
else
	instance_destroy()