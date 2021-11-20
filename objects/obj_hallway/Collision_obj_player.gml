if !used
{
	with other {
		hspeedsave = hspeed
		vspeedsave = 0
	}
	other.spawn = spawn
	other.statesave = other.state
	other.state = -1
	other.visible = 0
	var inst = instance_create_depth(x,y,-500,obj_roomfade)
	inst.targetroom = targetroom
	used = 1
	audio_play_sound(sfx_transition,1,0)
}