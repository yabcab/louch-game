audio_play_sound(sfx_explosion,1,0)
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

obj_music.alarm[0] = 200