if keyboard_check(vk_up) && instance_place(x,y+1,obj_solid) && state != playerstate.dying
{
	statesave = state
	state = playerstate.none
	fade = 1
	speed = 0
}