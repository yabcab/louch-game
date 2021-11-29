var i;
for (i = 0; i < 25; i++)
{
	instance_create_depth(x,y,-500,obj_explosionparticle)
}
audio_play_sound(sfx_fard,1,0)