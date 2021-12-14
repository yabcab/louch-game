if pause_state = pausestate.none
{
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
		with instance_create_depth(x,y,-1,obj_trail)
		{
			image_speed = 0
			startfade = 1
			sprite_index = s
			image_index = i
			image_xscale = _xs
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