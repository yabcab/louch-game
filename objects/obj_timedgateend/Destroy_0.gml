audio_play_sound(sfx_explosion,1,0)
var i;
for (i = 0; i < 400; i++)
{
	instance_create_depth(x,y,-500,obj_explosionparticle)
}

with instance_create_depth(x,y,0,obj_thudthing)
{
	image_xscale = 0.8
	image_yscale = 0.8
}