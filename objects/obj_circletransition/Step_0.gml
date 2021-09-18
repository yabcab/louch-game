_time++

//circle activations
if _time > 15 && !circle_1
{
	circle_1 = 1
	circle_1_prog = 1
	if obj_player.state = playerstate.level_end
		obj_music.mu = mu_wait
}
if _time > 50 && !circle_2
{
	circle_2 = 1
	circle_2_prog = 1
}
if _time > 100 && !circle_3
{
	circle_3 = 1
	circle_3_prog = 1
}
if _time > 200 && circle_1_prog = 2
{
	circle_1_prog = 3
	circle_2_prog = 3
	circle_3_prog = 3
	room_goto(targetroom)
}

//circle scales
if circle_1
{
	if circle_1_prog = 1
	{
		circle_1_scale += circle_1_scalespeed
		circle_1_scalespeed = (3 - circle_1_scale) / 10
		if circle_1_scale > 2.95
			circle_1_prog = 2
	}
	if circle_1_prog = 2
	{
		circle_1_scale = (sin(circle_1_time / 20) / 8) + 3
		circle_1_time++
	}
	if circle_1_prog = 3
	{
		circle_1_scale -= circle_1_scalespeed
		circle_1_scalespeed = (circle_1_scale) / 10
	}
}
if circle_2
{
	if circle_2_prog = 1
	{
		circle_2_scale += circle_2_scalespeed
		circle_2_scalespeed = (6 - circle_2_scale) / 15
		if circle_2_scale > 5.95
			circle_2_prog = 2
	}
	if circle_2_prog = 2
	{
		circle_2_scale = (sin(circle_2_time / 20) / 8) + 6
		circle_2_time++
	}
	if circle_2_prog = 3
	{
		circle_2_scale -= circle_2_scalespeed
		circle_2_scalespeed = (circle_2_scale) / 7
	}
}
if circle_3
{
	if circle_3_prog = 1
	{
		circle_3_scale += circle_3_scalespeed
		circle_3_scalespeed = (16 - circle_3_scale) / 20
		if circle_3_scale > 15.95
			circle_3_prog = 2
	}
	if circle_3_prog = 2
	{
		circle_3_scale = (sin(circle_3_time / 20) / 8) + 15
		circle_3_time++
	}
	if circle_3_prog = 3
	{
		circle_3_scale -= circle_3_scalespeed
		circle_3_scalespeed = (circle_3_scale) / 5
	}
}

//destroying
if circle_1_prog = 3 && circle_3_scale < 0.05
	instance_destroy()