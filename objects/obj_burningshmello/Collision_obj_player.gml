if other.state = playerstate.boost || other.dashing
{
	instance_destroy()
	other.combo += 1
	obj_hud.combotimer = 180
	var h = hspeed
	var s = spr_dead
		with instance_create_depth(x,y,other.depth + 1,obj_eatenapple)
		{
			sprite_index = s
			vspeed = random_range(-5,-7)
			hspeed = obj_player.hspeed + h
			effect = 1
			rot_speed = 15
			image_xscale = other.xs
		}
	
	audio_play_sound(sfx_hitwall3,1,0)
}
else if other.state != playerstate.dying && other.inv = 0
{
	if other.state != playerstate.boost && other.state != playerstate.hurt
	{
		score -= 100
		if score < 0
			score = 0
		other.inv = 1
		obj_hud.combotimer = 0
		other.combo = 0
		other.wait = 0
		other.alarm[1] = 150
		other.state = playerstate.hurt
		other.hp -= 1
		other.vspeed = -7
		other.hspeed = 4 * -(other.facing)
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
			
		if other.hp <= 0
			with other {
				state = playerstate.dying
				hspeed = random_range(10,15) * (facing * -1)
				vspeed = random_range(-13,-18)
				audio_play_sound(sfx_ricochet,1,0)
			}
	}
}