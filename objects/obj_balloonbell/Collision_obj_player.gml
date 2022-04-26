if other.state = playerstate.none
	exit;
if instance_place(x,y+1,obj_solid) || instance_place(x,y + 5,obj_slope) || instance_place(x,y+1,obj_platform)
	onground = 1
else
	onground = 0

if other.state = 3 || other.dashing
{
	scr_enemy_death(0)
}
else if other.vspeed > 0.5 && y - 5 > other.y && !other.onground// && onground
{
	/*if state = 1 && wait > 25
	{
		state = 2
		hspeed = 7 * other.facing
		xs = -(other.facing)
		sprite_index = spr_bella_hit
	} */
		state = 1
		//vspeed = -3
	
		if other.key_jump
		{
			other.vspeed = -9
			other.jumping = 1
		}
		else
			other.vspeed = -6
		
		other.beginjump = 1
		other.image_index = 0
		other.justhitenemy = 1
		other.alarm[0] = 5
		wait = 0
	
		audio_play_sound(sfx_bonk,1,0)
		do_hitstun(3)
}
else if other.state != 11 && other.inv = 0
{
	if other.state != 3 && other.state != 4 && state = 0
	{
		nodamage = 0
		score -= 100
		if score < 0
			score = 0
		other.inv = 1
		other.inv_frames = 1
		obj_hud.combotimer = 0
		other.combo = 0
		other.alarm[1] = 150
		other.state = 4
		other.wait = 0
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
		instance_create_depth(other.x,other.y,-1,obj_eatenapple)
		instance_create_depth(other.x,other.y,-1,obj_eatenapple)
		instance_create_depth(other.x,other.y,-1,obj_eatenapple)
			
		if other.hp <= 0
			with other {
				state = 11
				hspeed = random_range(10,15) * (facing * -1)
				vspeed = random_range(-13,-18)
				audio_play_sound(sfx_ricochet,1,0)
			}
	}
	
}