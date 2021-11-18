instance_destroy()
var h = hspeed
var s = spr_dead
	with instance_create_depth(x,y,other.depth + 1,obj_eatenapple)
	{
		sprite_index = s
		vspeed = random_range(-5,-7)
		hspeed = obj_player.hspeed + h
		effect = 1
		rot_speed = 15
	}
audio_play_sound(sfx_schlap,1,0)
do_hitstun(5)
instance_create_depth(mean(x,obj_player.x),mean(y,obj_player.y),depth - 1,obj_hitstuneffect)
obj_hud.combotimer = 180
score += 20 * (obj_player.combo / 2)
obj_player.combo += 1
ds_list_set(destroy_list,id,1)