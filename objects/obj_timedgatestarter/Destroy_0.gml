if set
{
	instance_create_depth(x,y,-1,obj_eatenapple)
	instance_create_depth(x,y,-1,obj_eatenapple)
	instance_create_depth(x,y,-1,obj_eatenapple)
	instance_create_depth(x,y,-1,obj_eatenapple)
	instance_create_depth(x,y,-1,obj_eatenapple)
	instance_create_depth(x,y,-1,obj_eatenapple)
	instance_create_depth(x,y,-1,obj_eatenapple)
	instance_create_depth(x,y,-1,obj_eatenapple)
	instance_create_depth(x,y,-1,obj_eatenapple)
	audio_stop_sound(sfx_run)
	is_trial = 1
	with instance_create_depth(x,y,0,obj_thudthing)
	{
		image_xscale = 0.8
		image_yscale = 0.8
	}
	var m = minutes
	var s = seconds
	with instance_create_depth(x,y,0,obj_timer)
	{
		minutes = m
		seconds = s
	}
}