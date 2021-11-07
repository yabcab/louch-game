if key_up && instance_place(x,y+1,obj_solid) && state != playerstate.dying && !recently_entered_room
{
	statesave = state
	state = playerstate.none
	fade = 1
	speed = 0
	spawn = other.spawn
	targetroom = other.targetroom
}