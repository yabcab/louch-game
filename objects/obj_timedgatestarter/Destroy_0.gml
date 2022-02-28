if set
{
	var i;
	for (i = 0; i < 100; i++)
	{
		instance_create_depth(x,y,-500,obj_explosionparticle)
	}
	with instance_create_depth(x,y,depth - 1,obj_explosionparticle)
	{
		speed = 0
		image_alpha = 5
		sprite_index = spr_boom
	}
	audio_stop_sound(sfx_run)
	obj_music.trialmusic = trialmusic
	obj_music.trialmusicsecret = secrettrialmusic
	is_trial = 1
	if timetrial
		is_timetrial = 1
	with instance_create_depth(x,y,0,obj_thudthing)
	{
		image_xscale = 0.8
		image_yscale = 0.8
	}
	var m = minutes
	var s = seconds
	if !instance_exists(obj_timer)
	{
		with instance_create_depth(x,y,0,obj_timer)
		{
			minutes = m
			seconds = s
		}
	}
	else
	{
		with obj_timer
		minutes = m
		seconds = s
	}
	
	audio_stop_sound(deathsfx)
	if sprite_index = spr_clockface_dead
		audio_play_sound(sfx_clockbell,1,0)
	instance_create_depth(x,y,depth,obj_whiteout)
	do_camerashake(2,2,20)
	do_zoomfx(-3,0)
}