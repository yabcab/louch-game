_time = 0

circle_1 = 0
circle_2 = 0
circle_3 = 0
circle_1_scale = 0
circle_2_scale = 0
circle_3_scale = 0
circle_1_scalespeed = 0
circle_2_scalespeed = 0
circle_3_scalespeed = 0
circle_1_prog = 0
circle_2_prog = 0
circle_3_prog = 0
circle_1_time = 0
circle_2_time = 0
circle_3_time = 0
circle_1_col = make_color_rgb(66,134,255)
circle_2_col = make_color_rgb(6,84,224)
circle_3_col = make_color_rgb(0,63,177)

targetroom = rm_hub1
pause_state = pausestate.playerpause

ini_open("savedata.lmao")
var i;
for (i = 0; i < crowncollecttotal; i++)
	if ini_read_real("crowncollects_" + string(level),i,0) = 0
		ini_write_real("crowncollects_" + string(level),i,crownarray[i])
ini_write_real("stats","totalcrowns",totalcrowns)
