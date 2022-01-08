if instance_place(x,y,obj_player) && obj_player.key_up && pause_state = pausestate.none && opened = 0
{
	opened = 1
	pause_state = pausestate.playerpause
}