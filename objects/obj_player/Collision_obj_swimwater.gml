if state != playerstate.taunt && state != playerstate.dying && state != playerstate.swim && state != playerstate.none
{
	state = playerstate.swim
	var i;
	for (i = 0; i < 20; i++)
		with instance_create_depth(random_range(bbox_left,bbox_right),bbox_bottom - 16,depth + 1,obj_eatenapple)
		{
			fadeout = 1
			vspeed = random_range(-3,-5)
			hspeed = random_range(-1.5,1.5)
		}
}