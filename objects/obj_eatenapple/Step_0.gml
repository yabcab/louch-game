if pause_state = pausestate.none
{
	//x -= hspeed
	//x += hspeed * image_yscale
	//y -= vspeed
	//y += vspeed * image_yscale
	
	//image_xscale += popout
	//image_yscale += popout
	
	vspeed += 0.15
	image_angle += rot_speed * rot_dir

	if y > room_height
		instance_destroy()
	
	if effect
	{
		var s = sprite_index
		var _xs = image_xscale
		var i = image_index
		var ia = image_angle
		with instance_create_depth(x,y,-11,obj_trail)
		{
			image_speed = 0
			startfade = 1
			sprite_index = s
			image_index = i
			image_xscale = _xs
			image_yscale = other.image_yscale
			image_angle = ia
		}
	}
	
	if fadeout
	{
		fadetime++
		if fadetime > 10
			image_alpha -= 0.05
	}
}
else
{
	y -= vspeed
	x -= hspeed
}