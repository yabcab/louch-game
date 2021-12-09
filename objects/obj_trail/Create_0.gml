if instance_exists(obj_player)
{
	alarm[0] = 10
	image_speed = 0
	image_index = obj_player.image_index
	sprite_index = obj_player.sprite_index
	image_xscale = obj_player.facing
	image_angle = obj_player.rot
}
image_alpha = 0.4
startfade = 0
flash = 0
flashtime = 0
alph = 1
if pause_state = pausestate.playerpause
	instance_destroy()