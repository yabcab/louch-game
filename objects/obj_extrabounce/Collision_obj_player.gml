instance_destroy()
with other {
	if key_jump
		if vspeed > -10
			vspeed = -10
		else
			vspeed -= 10
	else
		if vspeed > -7
			vspeed = -7
		else
			vspeed -= -7
	
	beginjump = 1
	image_index = 0
	jumping = 1
}