if state != playerstate.dying && state != playerstate.lava_hurt
	state = playerstate.lava_hurt
vspeed = -12
hp -= 1
if hp < 0
	instance_destroy()