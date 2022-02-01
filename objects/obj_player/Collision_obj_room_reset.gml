audio_play_sound(sfx_fallout,1,0)
x = checkpoint_x
y = checkpoint_y - 1
audio_play_sound(sfx_fallout,1,0)
deaths += 1
state = idlestate
with obj_camera
{
	x = other.x
	y = other.y
}