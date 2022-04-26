do_hitstun(3)
var s = spr_dead
instance_destroy()
with instance_create_depth(x,y,other.depth + 1,obj_eatenapple)
{
	sprite_index = s
	vspeed = random_range(-3,-5)
}
	
audio_play_sound(sfx_bonk,1,0)
ds_list_set(destroy_list,id,1)