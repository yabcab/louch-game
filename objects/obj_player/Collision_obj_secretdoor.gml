if key_up && instance_place(x,y+1,obj_solid) && state != playerstate.dying && !recently_entered_room
{
	if state != -1
		audio_play_sound(sfx_transition,1,0)
	statesave = state
	state = playerstate.none
	visible = 0
	speed = 0
	spawn = other.spawn
	targetroom = other.targetroom
	sprite_index = spr_playerLS_still
	
	if !instance_exists(obj_secrettransitionchar)
	{
		instance_create_depth(x,y,-2,obj_secrettransition)
		with instance_create_depth(x,y,-2,obj_secrettransitionchar)
		{
			spawn = other.spawn
			targetroom = other.targetroom
		}
	}
	
	with other {
		ds_list_set(destroy_list,id,1)
	}
}