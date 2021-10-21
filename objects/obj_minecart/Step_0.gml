if active
{
	if keyboard_check_pressed(cont_jump) && (instance_place(x,y+5,obj_cartrail) || instance_place(x,y+5,obj_cartrailslope))
	{
		vspeed = -9
		jumping = 1
	}
	if jumping && !keyboard_check(cont_jump) && obj_player.use_varjump
	{
		vspeed = -3
		jumping = 0
	}
	if vspeed < 15
		vspeed += 0.3
	if vspeed > -3
		jumping = 0
		
	if instance_place(x + hspeed,y,obj_solid)
		hspeed *= -1
}

if !instance_place(x,y,obj_player)
{
	active = 0
	vspeed = 0
	hspeed = 0
	jumping = 0
	x = xstart
	y = ystart
}

while place_meeting(x, y + abs(hspeed) + 1, obj_cartrailslope) && !place_meeting(x, y + 1, obj_cartrailslope) && !jumping
{
	y += 0.1
}
while place_meeting(x + hspeed, y, obj_slope)
{
	y -= 0.1
}