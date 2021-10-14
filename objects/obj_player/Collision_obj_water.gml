if state != playerstate.dying
	state = playerstate.water_jump
vspeed = -20
instance_create_depth(x,y + 60,depth,obj_waterfish)