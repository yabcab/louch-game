if state != playerstate.dying
	state = playerstate.water_jump
vspeed = -20
beginjump = 1
image_index = 0
instance_create_depth(x,y + 60,depth,obj_waterfish)