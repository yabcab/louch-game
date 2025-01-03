if hitable
{
	if other.state = playerstate.none
		exit;
	if other.state = playerstate.boost || other.dashing
	{
		obj_hud.combotimer = 180
		other.combo += 1
		score += 20 * (other.combo / 2)
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
				image_yscale = other.xs
			}
	
		audio_play_sound(sfx_hitwall3,1,0)
		do_hitstun(5)
	}
	else if other.state != playerstate.dying
	{
		if other.vspeed > 0.5 && y - 5 > other.y && !other.onground
		{
			if other.state = playerstate.hurt
				other.state = other.idlestate
			obj_hud.combotimer = 180
			hp -= 1
			hitable = 0
			do_hitstun(3)
			//var s = spr_dead
			//instance_destroy()
			//with instance_create_depth(x,y,other.depth + 1,obj_eatenapple)
			//{
			//	sprite_index = s
			//	vspeed = random_range(-3,-5)
			//	image_xscale = other.xs
			//	hspeed = random_range(other.hspeed - 2,other.hspeed + 2)
			//}
	
			if !other.dashing
			{
				if other.key_jump
				{
					other.vspeed = -9
					other.jumping = 1
				}
				else
					other.vspeed = -6
			}
		
			other.beginjump = 1
			other.image_index = 0
			other.justhitenemy = 1
			other.alarm[0] = 5
	
			other.combo += 1
			var snd = audio_play_sound(sfx_bonk,1,0)
			audio_sound_pitch(snd,1 + (clamp((other.combo - 1),0,6) / 10))
			score += 20 * (other.combo)
			ds_list_set(destroy_list,id,1)
			
			vspeed = -2
			alarm[2] = 100
			state = nolanstate.sit
		}
		else if !other.inv && canhurtplayer
		{
			if other.state != playerstate.boost && other.state != playerstate.hurt && !other.justhitenemy
			{
				score -= 100
				obj_hud.combotimer = 0
				other.combo = 0
				if score < 0
					score = 0
				other.inv = 1
				other.inv_frames = q
				other.alarm[1] = 150
				other.state = playerstate.hurt
				other.hp -= 1
				other.vspeed = -7
				other.wait = 0
				other.hspeed = 4 * -(other.facing)
				other.combo = 0
				if !audio_is_playing(sound)
					sound = audio_play_sound(sfx_pain,1,0)
		
				instance_create_depth(other.x,other.y,-1,obj_eatenapple)
				instance_create_depth(other.x,other.y,-1,obj_eatenapple)
				instance_create_depth(other.x,other.y,-1,obj_eatenapple)
				instance_create_depth(other.x,other.y,-1,obj_eatenapple)
				instance_create_depth(other.x,other.y,-1,obj_eatenapple)
				instance_create_depth(other.x,other.y,-1,obj_eatenapple)
				instance_create_depth(other.x,other.y,-1,obj_eatenapple)
				instance_create_depth(other.x,other.y,-1,obj_eatenapple)
				instance_create_depth(other.x,other.y,-1,obj_eatenapple)
				instance_create_depth(other.x,other.y,-1,obj_eatenapple)
				instance_create_depth(other.x,other.y,-1,obj_eatenapple)
			
				if other.hp <= 0
					with other {
						state = playerstate.dying
						hspeed = random_range(10,15) * (facing * -1)
						vspeed = random_range(-13,-18)
						audio_play_sound(sfx_ricochet,1,0)
					}
			}
		}
	}
}