//if keyboard_check_pressed(vk_escape)
//{
//	if pause_state = pausestate.none
//	{
//		pause_state = pausestate.playerpause
//		pause = 1
//	}
//	else
//	{
//		pause_state = pausestate.none
//		pause = 0
//	}
//}

if inv
{
	invtime += 1
	if alph != 0
	{
		old_alph = alph
		alph = 0
	}
	else if invtime > 2
	{
		alph = old_alph
		invtime = 0
	}
}
else
	if alph = 0
		alph = old_alph

if fade = 1
{
	fade_amount += 0.05
	if fade_amount > 1
	{
		room_goto(targetroom)
		fade = 2
	}
}
else if fade = 2
{
	fade_amount -= 0.05
	if fade_amount < 0
		fade = 0
}
else
	fade_amount = 0

if instance_exists(obj_timer)
{
	if !obj_timer.minutes && !obj_timer.seconds	
		instance_destroy()
}


switch state { // normal
	case playerstate.idle:
	{
		//louchester anims
		if campaign = 3
		{
			if instance_place(x,y + 1,obj_solid) || instance_place(x,y + 1,obj_slope)
			{
				if hspeed = 0
					if jumpcharge > 0
						if jumpcharge_starting
							sprite_index = spr_playerLS_chargejumpstart
						else
							if jumpcharge > 15
								sprite_index = spr_playerLS_chargejumpready
							else
								sprite_index = spr_playerLS_chargejump
					else
						sprite_index = spr_playerLS_still
				else
					sprite_index = spr_playerLS_walk
				
				beginfall = 1
				beginfall_start = 1
			}		
			else
			if !dashing
				if beginjump
				{
					if enddash
						sprite_index = spr_playerLS_airjumpend
					else
						sprite_index = spr_playerLS_jumpstart
					beginfall = 0
				}
				else
					if beginfall = 0
						sprite_index = spr_playerLS_jumpair
					else
					{
						sprite_index = spr_playerLS_beginfall
						if beginfall_start
						{
							image_index = 0
							beginfall_start = 0
						}
					}
			else
				if beginjump
					sprite_index = spr_playerLS_boostjumpstart
				else
					sprite_index = spr_playerLS_boostjumpair
		}
		
		// velocity
		if vspeed < 15
			vspeed += 0.3
		
		
		// walkin
		if keyboard_check(vk_up) && !dashing && (instance_place(x,y + 1,obj_solid) || instance_place(x,y + 1,obj_slope))
		{
			if jumpcharge < 1
			{
				jumpcharge_starting = 1
				image_index = 0
			}
			jumpcharge += 1
			hspeed = 0
		}
		else
		{
			jumpcharge = 0
			if keyboard_check(vk_right) && !dashing
				hspeed = 4
			else 
			if keyboard_check(vk_left) && !dashing
				hspeed = -4
			else
				if !dashing
					hspeed = 0
		}
			
		// jumpin
		if keyboard_check_pressed(ord("Z")) && (instance_place(x,y + 5,obj_solid) || instance_place(x,y + 5,obj_slope)) // ground
		{
			if keyboard_check(vk_up) && jumpcharge > 30
			{
				vspeed = -13
				jumpcharge = 0
				jump_charged = 1
			}
			else
				vspeed = -9
				
			if !(instance_place(x,y + 10,obj_airjump) || instance_place(x,y,obj_airjump))
				audio_play_sound(sfx_jump,1,0)
				
			beginjump = 1
			jumping = 1
			image_index = 0
		}
		if jumping && !keyboard_check(ord("Z"))
		{
			vspeed = -3
			jumping = 0
		}
				
		// dashin
		//if keyboard_check_pressed(ord("X")) && dash_charge = 1
		//{
		//	if keyboard_check(vk_right)
		//		hspeed = 9
		//	else
		//	if keyboard_check(vk_left)
		//		hspeed = -9
		//	else
		//	hspeed = 0
			
		//	vspeed = -2
		//	dashing = 1
		//	dash_charge = 0
		//	beginjump = 1
		//	image_index = 0
		//}
		
		// dash end
		if keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right)
			dashing = 0
		
		// dash hitbox
		if dashing = 1
		{
			if hspeed < 0
				instance_create_depth(x - 35,y,depth,obj_dash_hitbox)
			else if hspeed > 0
				instance_create_depth(x + 35,y,depth,obj_dash_hitbox)
			
			if vspeed < -5 && use_dash > 1
				instance_create_depth(x,y -40,depth,obj_dash_hitbox_u)
		}
		
		// ground pound
		if use_gp && !pounding && !(instance_place(x,y+5,obj_solid) || instance_place(x,y + 5,obj_slope)) && keyboard_check_pressed(vk_down)
		{
			state = playerstate.ground_pound
			pounding = 1
			begingp = 1
		}
		gp_time = 0
		
			if hspeed < 0
				facing = -1
			if hspeed > 0
				facing = 1
		// taunt
		taunt_qualify = 1
	}
	break;
	
	case playerstate.old_portal:
	{
		x = obj_goalflag.x + 32
		y = obj_goalflag.y + 32
		
		ys -= 0.015
		xs -= 0.015
		rot += 5
		
		if xs <= 0
			room_goto_next()
		
		if campaign = 3
			sprite_index = spr_player_ls
	}
	break;
	
	case playerstate.ground_pound:
	{
		if campaign = 3
		{
			if begingp
				sprite_index = spr_playerLS_gpstart
			else
				sprite_index = spr_playerLS_gp
		}
		
		gp_time += 1
		if gp_time > 25
			vspeed = 8
		else
			vspeed = -0.5
		
		if keyboard_check(vk_left)
			hspeed = -2.5
		else
		if keyboard_check(vk_right)
			hspeed = 2.5
		else
		hspeed = 0
		
		if !pounding
			state = playerstate.sad
		
		instance_create_depth(x,y + 40,depth,obj_dash_hitbox_u)
		
		if instance_place(x,y,obj_airjump)
		{
			state = playerstate.idle
			if keyboard_check(vk_up)
				vspeed = -11
			else
				vspeed = -9
				
			audio_play_sound(sfx_jump,1,0)
		}
		
			if hspeed < 0
				facing = -1
			if hspeed > 0
				facing = 1
	
	}
	break;
	
	case playerstate.boost: // boost
	{
		// anims
		if instance_place(x,y+1,obj_solid) || instance_place(x,y + 1,obj_slope)
			sprite_index = spr_playerLS_boost
		else
			if beginjump
				if jumps > 0
					if diving
						sprite_index = spr_playerLS_dive
					else
						sprite_index = spr_playerLS_bjumpstart
				else
					if diving
						sprite_index = spr_playerLS_dive
					else
						sprite_index = spr_playerLS_bjumpstart2
			else
				if jumps > 0
					if diving
						sprite_index = spr_playerLS_dive
					else
						sprite_index = spr_playerLS_bjump
				else
					if diving
						sprite_index = spr_playerLS_dive
					else
						sprite_index = spr_playerLS_bjump2
		
		// velocity
		if vspeed < 15
			vspeed += 0.3
		if keyboard_check(vk_down)
		{
			vspeed = 10
			diving = 1
		}
		else
			diving = 0
		
		hspeed = 7 * facing
		
		if keyboard_check_pressed(ord("Z")) && ((instance_place(x,y + 5,obj_solid) || instance_place(x,y + 5,obj_slope)) || jumps > 0) // ground
		{
			vspeed = -9
				
			if !(instance_place(x,y + 10,obj_airjump) || instance_place(x,y,obj_airjump))
				audio_play_sound(sfx_jump,1,0)
				
			beginjump = 1
			image_index = 0
			jumping = 1
			jumps -= 1
		}
		if jumping && !keyboard_check(ord("Z"))
		{
			vspeed = -3
			jumping = 0
		}
		
		if instance_place(x + hspeed,y,obj_solid)
			state = idlestate
		if instance_place(x,y + 5,obj_solid)
			jumps = 1
			
		instance_create_depth(x + (40 * facing),y,-1,obj_dash_hitbox)
		trailspawntime++
		if trailspawntime > 5
		{
			trailspawntime = 0
			with instance_create_depth(x,y,depth + 1,obj_trail)
			{
				image_alpha = 0.5
				flash = 0
			}
		}
		
		// taunt
		taunt_qualify = 1
		
	}
	break;
	
	case playerstate.hurt: // hurt
	{
		// velocity
		if vspeed < 15
			vspeed += 0.3
			
		hspeed = 4 * -facing
		
		sprite_index = spr_playerLS_pain
		
		hurttime += 1
		
		taunt_qualify = 0
	}
	break;
	
	case playerstate.taunt: // taunt
	{
		//if jumping && !keyboard_check(ord("Z"))
		//{
		//	vspeedsave = -3
		//	jumping = 0
		//}
		speed = 0
		wait += 1
		if wait > 15
		{
			state = statesave
			hspeed = hspeedsave
			vspeed = vspeedsave
			wait = 0
		}
		taunt_qualify = 0
	}
	break;
		
	case playerstate.sad: // sad
	{
		//louchester anims
		if campaign = 3
		{
			if instance_place(x,y + 1,obj_solid) || instance_place(x,y + 1,obj_slope)
			{
				if hspeed = 0
					sprite_index = spr_playerLS_sadidle
				else
					sprite_index = spr_playerLS_sadwalk
				
				beginfall = 1
				beginfall_start = 1
			}		
			else
			if !dashing
				if beginjump
				{
					if enddash
						sprite_index = spr_playerLS_airjumpend
					else
						sprite_index = spr_playerLS_jumpstart
					beginfall = 0
				}
				else
					if beginfall = 0
						sprite_index = spr_playerLS_jumpair
					else
					{
						sprite_index = spr_playerLS_beginfall
						if beginfall_start
						{
							image_index = 0
							beginfall_start = 0
						}
					}
			else
				if beginjump
					sprite_index = spr_playerLS_boostjumpstart
				else
					sprite_index = spr_playerLS_boostjumpair
		}
		
		// velocity
		if vspeed < 15
			vspeed += 0.3
		
		
		// walkin
		if keyboard_check(vk_right) && !dashing
			hspeed = 3
		else 
		if keyboard_check(vk_left) && !dashing
			hspeed = -3
		else
			if !dashing
				hspeed = 0
			
		// jumpin
		if keyboard_check_pressed(ord("Z")) && (instance_place(x,y + 5,obj_solid) || instance_place(x,y + 5,obj_slope)) // ground
		{
			if keyboard_check(vk_up)
				vspeed = -13
			else
				vspeed = -10
				
			if !(instance_place(x,y + 10,obj_airjump) || instance_place(x,y,obj_airjump))
				audio_play_sound(sfx_jump,1,0)
				
			beginjump = 1
			image_index = 0
		}
		/*if keyboard_check_pressed(ord("Z")) && (instance_place(x,y + 10,obj_airjump) || instance_place(x,y,obj_airjump))
		{
			audio_play_sound(sfx_airjump,1,0)
			
			if keyboard_check(vk_up)
				vspeed = -11
			else
				vspeed = -9
			
			dash_charge = 1
			beginjump = 1
			image_index = 0
		}
		if keyboard_check_pressed(ord("Z")) && (instance_place(x,y + 10,obj_rightdraft) || instance_place(x,y,obj_rightdraft)) && !instance_place(x,y+2,obj_solid)
		{
			audio_play_sound(sfx_airjump,1,0)
			
			var inst = instance_place(x,y,obj_rightdraft)
			if inst.image_xscale > 0
			{
				hspeed = 11
				vspeed = -4
			}
			else
			{
				hspeed = -11
				vspeed = -4
			}
			
			dash_charge = 1
			dashing = 1
			beginjump = 1
			image_index = 0
		} */
		
				
		// dashin
		if keyboard_check_pressed(ord("X")) && dash_charge = 1 && use_dash > 0
		{
			if keyboard_check(vk_right)
				hspeed = 9
			else
			if keyboard_check(vk_left)
				hspeed = -9
			else
			hspeed = 0
			
			if use_dash > 1
			{
				if keyboard_check(vk_up)
					vspeed = -9
				else
				vspeed = -3
			}
			else
				vspeed = -3
			
			dashing = 1
			dash_charge = 0
			beginjump = 1
			image_index = 0
		}
		
		// dash end
		if keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right)
			dashing = 0
		
		// dash hitbox
		if dashing = 1
		{
			if hspeed < 0
				instance_create_depth(x - 35,y,depth,obj_dash_hitbox)
			else if hspeed > 0
				instance_create_depth(x + 35,y,depth,obj_dash_hitbox)
			
			if vspeed < -5 && use_dash > 1
				instance_create_depth(x,y -40,depth,obj_dash_hitbox_u)
		}
		
		// ground pound
		if !pounding && !instance_place(x,y+5,obj_solid) && keyboard_check_pressed(vk_down)
		{
			state = playerstate.ground_pound
			pounding = 1
			begingp = 1
		}
		gp_time = 0
		
			if hspeed < 0
				facing = -1
			if hspeed > 0
				facing = 1
		// taunt
		taunt_qualify = 1
	}
	break;
	
	case playerstate.happy:
	{
		//louchester anims
		if campaign = 3
		{
			if instance_place(x,y + 1,obj_solid) || instance_place(x,y + 1,obj_slope)
			{
				if hspeed = 0
					sprite_index = spr_playerLS_still
				else
					sprite_index = spr_playerLS_walk
				
				beginfall = 1
				beginfall_start = 1
			}		
			else
			if !dashing
				if beginjump
				{
					if enddash
						sprite_index = spr_playerLS_airjumpend
					else
						sprite_index = spr_playerLS_jumpstart
					beginfall = 0
				}
				else
					if beginfall = 0
						sprite_index = spr_playerLS_jumpair
					else
					{
						sprite_index = spr_playerLS_beginfall
						if beginfall_start
						{
							image_index = 0
							beginfall_start = 0
						}
					}
			else
				if beginjump
					sprite_index = spr_playerLS_boostjumpstart
				else
					sprite_index = spr_playerLS_boostjumpair
		}
		
		// velocity
		if vspeed < 15
			vspeed += 0.3
		
		
		// walkin
		if keyboard_check(vk_right) && !dashing
			hspeed = 6
		else 
		if keyboard_check(vk_left) && !dashing
			hspeed = -6
		else
			if !dashing
				hspeed = 0
			
		// jumpin
		if keyboard_check_pressed(ord("Z")) && instance_place(x,y + 5,obj_solid) // ground
		{
			if keyboard_check(vk_up)
				vspeed = -9
			else
				vspeed = -7
				
			if !(instance_place(x,y + 10,obj_airjump) || instance_place(x,y,obj_airjump))
				audio_play_sound(sfx_jump,1,0)
				
			beginjump = 1
			image_index = 0
		}
		if keyboard_check_pressed(ord("Z")) && (instance_place(x,y + 10,obj_airjump) || instance_place(x,y,obj_airjump))
		{
			audio_play_sound(sfx_airjump,1,0)
			
			if keyboard_check(vk_up)
				vspeed = -11
			else
				vspeed = -9
			
			dash_charge = 1
			beginjump = 1
			image_index = 0
		}
		if keyboard_check_pressed(ord("Z")) && (instance_place(x,y + 10,obj_rightdraft) || instance_place(x,y,obj_rightdraft)) && !instance_place(x,y+2,obj_solid)
		{
			audio_play_sound(sfx_airjump,1,0)
			
			var inst = instance_place(x,y,obj_rightdraft)
			if inst.image_xscale > 0
			{
				hspeed = 11
				vspeed = -4
			}
			else
			{
				hspeed = -11
				vspeed = -4
			}
			
			dash_charge = 1
			dashing = 1
			beginjump = 1
			image_index = 0
		}
		
				
		// dashin
		if keyboard_check_pressed(ord("X")) && dash_charge = 1 && use_dash > 0
		{
			if keyboard_check(vk_right)
				hspeed = 9
			else
			if keyboard_check(vk_left)
				hspeed = -9
			else
			hspeed = 0
			
			if use_dash > 1
			{
				if keyboard_check(vk_up)
					vspeed = -9
				else
				vspeed = -3
			}
			else
				vspeed = -3
			
			dashing = 1
			dash_charge = 0
			beginjump = 1
			image_index = 0
		}
		
		// dash end
		if keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right)
			dashing = 0
		
		// dash hitbox
		if dashing = 1
		{
			if hspeed < 0
				instance_create_depth(x - 35,y,depth,obj_dash_hitbox)
			else if hspeed > 0
				instance_create_depth(x + 35,y,depth,obj_dash_hitbox)
			
			if vspeed < -5 && use_dash > 1
				instance_create_depth(x,y -40,depth,obj_dash_hitbox_u)
		}
		
		// ground pound
		if use_gp && !pounding && !instance_place(x,y+5,obj_solid) && keyboard_check_pressed(vk_down)
		{
			state = playerstate.ground_pound
			pounding = 1
			begingp = 1
		}
		gp_time = 0
		
			if hspeed < 0
				facing = -1
			if hspeed > 0
				facing = 1
		// taunt
		taunt_qualify = 1
	}
	break;
	
	case playerstate.balloon_normal: // balloon
	{
		if vspeed != 1
			vspeed = lerp(vspeed,1,0.1)
		if keyboard_check(vk_right) && !dashing
			hspeed = 5
		else 
		if keyboard_check(vk_left) && !dashing
			hspeed = -5
		else
			if !dashing
				hspeed = 0
		
		if keyboard_check(ord("Z"))
		{
			state = idlestate
			vspeed = -5
		}
		
		// taunt
		taunt_qualify = 1
	}
	break;
	
	case playerstate.balloon_dash:
	{
		if vspeed != -1
			vspeed = lerp(vspeed,-1,0.1)
		hspeed = 7 * facing
			
		instance_create_depth(x + 40,y,-1,obj_dash_hitbox)
		if !instance_place(x,y,obj_trail)
			instance_create_depth(x,y,depth + 1,obj_trail)
		
		// taunt
		taunt_qualify = 1
		
		if keyboard_check(ord("Z"))
		{
			state = idlestate
			vspeed = -5
		}
		
	}
	break;
	
	case playerstate.water_jump:
	{
		sprite_index = spr_playerLS_pain
		
		if keyboard_check(vk_right)
			hspeed = 3
		else 
		if keyboard_check(vk_left)
			hspeed = -3
		else
			hspeed = 0
			
		if vspeed < 15
			vspeed += 0.3
			
		if instance_place(x,y+1,obj_solid)
			state = idlestate
			
		taunt_qualify = 0
	}
	break;
	
	case playerstate.dying:
	{
		if vspeed < 15
			vspeed += 0.3
		
		//hspeed = lerp(hspeed,0,0.015)
		
		rot += abs(hspeed) * (sign(hspeed) * -1)
		
		if abs(hspeed) < 3 && abs(vspeed) < 7 && instance_place(x,y+5,obj_solid)
			instance_destroy()
			
		var s = sprite_index
		var _xs = xs * facing
		var i = image_index
		var ia = rot
		with instance_create_depth(x,y,depth + 1,obj_trail)
		{
			image_speed = 0
			startfade = 1
			sprite_index = s
			image_index = i
			image_xscale = _xs
			image_angle = ia
		}
		
		sprite_index = spr_playerLS_pain
		
		taunt_qualify = 0
	}
	break;
	
	case playerstate.high:
	{
		//louchester anims
		if campaign = 3
		{
			if instance_place(x,y + 1,obj_solid) || instance_place(x,y + 1,obj_slope)
			{
				if abs(hspeed) < 0.25
					sprite_index = spr_playerLS_high_idle
				else
					sprite_index = spr_playerLS_high_walk
				
				beginfall = 1
				beginfall_start = 1
			}		
			else
			if !dashing
				if beginjump
				{
					if enddash
						sprite_index = spr_playerLS_airjumpend
					else
						sprite_index = spr_playerLS_high_jumpstart
					beginfall = 0
				}
				else
					if beginfall = 0
						sprite_index = spr_playerLS_high_jump
					else
					{
						sprite_index = spr_playerLS_high_ledgefall
						if beginfall_start
						{
							image_index = 0
							beginfall_start = 0
						}
					}
			else
				if beginjump
					sprite_index = spr_playerLS_boostjumpstart
				else
					sprite_index = spr_playerLS_boostjumpair
		}
		
		// velocity
		if vspeed < 15
			vspeed += 0.3
		
		
		// walkin
		if keyboard_check(vk_right) && !dashing
			hspeed = lerp(hspeed,6,0.05)
		else 
		if keyboard_check(vk_left) && !dashing
			hspeed = lerp(hspeed,-6,0.05)
		else
			if !dashing
				hspeed = lerp(hspeed,0,0.025)
			
		// jumpin
		if keyboard_check_pressed(ord("Z")) && instance_place(x,y + 5,obj_solid) // ground
		{
			if keyboard_check(vk_up) && jumpcharge > 15
			{
				vspeed = -13
				jumpcharge = 0
			}
			else
				vspeed = -9
				
			if !(instance_place(x,y + 10,obj_airjump) || instance_place(x,y,obj_airjump))
				audio_play_sound(sfx_jump,1,0)
				
			beginjump = 1
			image_index = 0
			jumping = 1
		}
		if jumping && !keyboard_check(ord("Z"))
		{
			vspeed = -3
			jumping = 0
		}
		
				
		//dashin
		if keyboard_check_pressed(ord("X")) && dash_charge = 1
		{
			if keyboard_check(vk_right)
				if hspeed < 8
					hspeed = 9
				else
					hspeed += 1.5
			else
			if keyboard_check(vk_left)
				if hspeed > -8
					hspeed = -9
				else
					hspeed += -1.5
			else
			hspeed = 0
			
			vspeed = -2
			dashing = 1
			dash_charge = 0
			beginjump = 1
			image_index = 0
		}
		
		// dash end
		if (keyboard_check_pressed(vk_left) && facing = 1) || (keyboard_check_pressed(vk_right) && facing = -1)
			dashing = 0
		
		// dash hitbox
		if dashing = 1
		{
			with instance_create_depth(x,y,depth + 1,obj_trail)
			{
				image_speed = 0
				startfade = 1
				sprite_index = other.sprite_index
				image_index = other.image_index
				image_xscale = other.xs * other.facing
				image_angle = other.image_angle
			}
			if hspeed < 0
				instance_create_depth(x - 35,y,depth,obj_dash_hitbox)
			else if hspeed > 0
				instance_create_depth(x + 35,y,depth,obj_dash_hitbox)
			
			if vspeed < -5 && use_dash > 1
				instance_create_depth(x,y -40,depth,obj_dash_hitbox_u)
		}
		
		// ground pound
		if use_gp && !pounding && !instance_place(x,y+5,obj_solid) && keyboard_check_pressed(vk_down)
		{
			state = playerstate.ground_pound
			pounding = 1
			begingp = 1
		}
		gp_time = 0
		
			if hspeed < 0
				facing = -1
			if hspeed > 0
				facing = 1
		// taunt
		taunt_qualify = 1
	}
	break;
	
	case playerstate.level_end:
	{
		if !(0.5 > abs(x - obj_winhole.x))
			x -= (x - obj_winhole.x) / 10
		else
			x = obj_winhole.x
		vspeed += 0.5
		hspeed = 0
		xs = 1 - abs(vspeed / 50)
		ys = 1 + abs(vspeed / 50)
		
		taunt_qualify = 0
	}
	break;
	
}

if taunt_qualify && keyboard_check_pressed(ord("C"))
	player_taunt()