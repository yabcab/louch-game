//if mouse_check_button_pressed(mb_left) || (mouse_check_button(mb_left) && keyboard_check(vk_shift))
//	instance_create_depth(random_range(x - 200,x + 200),y - 360,-1,obj_enemywallhitter)

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

if state != -1 && state != playerstate.taunt && state != playerstate.level_end
	nonstunstate = state

if instance_place(x,y + 1,obj_solid) || instance_place(x,y + abs(hspeed) + 2,obj_slope)
	onground = 1
else
	onground = 0
if onground
{
	coyote_time = 1
	alarm[4] = 10
}

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
		if room != rm_title
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
		{
			instance_destroy(obj_timer)
			state = -1
			visible = 0
			rot = 0
			speed = 0
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
		}
}


switch state { // normal
	case playerstate.none:
	{
		taunt_qualify = 0
		inv = 1
		alph = 1
		alarm[1] = 1
	}
	break;
	
	case playerstate.idle:
	{
		//louchester anims
		if campaign = 3
		{
			if onground
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
		if key_up && !dashing && (instance_place(x,y + 1,obj_solid) || instance_place(x,y + 1,obj_slope))
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
			if key_right && !dashing
				hspeed = 4
			else 
			if key_left && !dashing
				hspeed = -4
			else
				if !dashing
					hspeed = 0
		}
			
		// jumpin
		if key_jump_press && (instance_place(x,y + 5,obj_solid) || instance_place(x,y + 5,obj_slope) || coyote_time) // ground
		{
			if key_up && jumpcharge > 30
			{
				vspeed = -13
				jumpcharge = 0
				jump_charged = 1
				coyote_time = 0
			}
			else
				vspeed = -9
				
			if !(instance_place(x,y + 10,obj_airjump) || instance_place(x,y,obj_airjump))
				audio_play_sound(sfx_jump,1,0)
				
			beginjump = 1
			jumping = 1
			image_index = 0
		}
		if jumping && !key_jump && use_varjump
		{
			vspeed = -3
			jumping = 0
		}
				
		// dashin
		//if keyboard_check_pressed(cont_attack) && dash_charge = 1
		//{
		//	if key_right
		//		hspeed = 9
		//	else
		//	if key_left
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
		if key_left_press || key_right_press
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
		if use_gp && !pounding && !(instance_place(x,y+5,obj_solid) || instance_place(x,y + 5,obj_slope)) && keyboard_check_pressed(cont_down)
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
		
		if key_left
			hspeed = -2.5
		else
		if key_right
			hspeed = 2.5
		else
		hspeed = 0
		
		if !pounding
			state = playerstate.sad
		
		instance_create_depth(x,y + 40,depth,obj_dash_hitbox_u)
		
		if instance_place(x,y,obj_airjump)
		{
			state = playerstate.idle
			if key_up
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
		if campaign = 3
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
		
		//sound
		if onground && !audio_is_playing(sfx_run)
			audio_play_sound(sfx_run,1,0)
		else if !onground
			audio_stop_sound(sfx_run)
		
		// velocity
		if vspeed < 15
			vspeed += 0.3
		if key_down
		{
			vspeed = 10
			diving = 1
		}
		else
			diving = 0
		
		hspeed = 7 * facing
		
		if key_jump_press && ((instance_place(x,y + 5,obj_solid) || instance_place(x,y + 5,obj_slope)) || jumps > 0 || coyote_time) // ground
		{
			vspeed = -9
				
			if !(instance_place(x,y + 10,obj_airjump) || instance_place(x,y,obj_airjump))
				audio_play_sound(sfx_jump,1,0)
				
			beginjump = 1
			image_index = 0
			jumping = 1
			jumps -= 1
			coyote_time = 0
		}
		if jumping && !key_jump && use_varjump
		{
			vspeed = -3
			jumping = 0
		}
		
		if instance_place(x + hspeed,y,obj_solid)
		{
			if instance_place(x + hspeed,y - 12,obj_solid)
			{
				state = idlestate
				audio_stop_sound(sfx_run)
			}
			else
				while instance_place(x + hspeed,y - 8,obj_solid)
					y -= 1
		}
		if coyote_time
			jumps = 2
		else
			if !onground && jumps = 2
				jumps = 1
		if instance_place(x,y + 5,obj_solid) || instance_place(x,y + 5,obj_slope)
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
		//if jumping && !key_jump
		//{
		//	vspeedsave = -3
		//	jumping = 0
		//}
		speed = 0
		wait += 1
		if wait > 15 && statesave != playerstate.taunt
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
		if key_right && !dashing
			hspeed = 3
		else 
		if key_left && !dashing
			hspeed = -3
		else
			if !dashing
				hspeed = 0
			
		// jumpin
		if key_jump_press && (instance_place(x,y + 5,obj_solid) || instance_place(x,y + 5,obj_slope)) // ground
		{
			if key_up
				vspeed = -13
			else
				vspeed = -10
				
			if !(instance_place(x,y + 10,obj_airjump) || instance_place(x,y,obj_airjump))
				audio_play_sound(sfx_jump,1,0)
				
			beginjump = 1
			image_index = 0
		}
		/*if key_jump_press && (instance_place(x,y + 10,obj_airjump) || instance_place(x,y,obj_airjump))
		{
			audio_play_sound(sfx_airjump,1,0)
			
			if key_up
				vspeed = -11
			else
				vspeed = -9
			
			dash_charge = 1
			beginjump = 1
			image_index = 0
		}
		if key_jump_press && (instance_place(x,y + 10,obj_rightdraft) || instance_place(x,y,obj_rightdraft)) && !instance_place(x,y+2,obj_solid)
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
		if key_attack_press && dash_charge = 1 && use_dash > 0
		{
			if key_right
				hspeed = 9
			else
			if key_left
				hspeed = -9
			else
			hspeed = 0
			
			if use_dash > 1
			{
				if key_up
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
		if key_left_press || key_right_press
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
		if !pounding && !instance_place(x,y+5,obj_solid) && key_down_press
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
		if key_right && !dashing
			hspeed = 6
		else 
		if key_left && !dashing
			hspeed = -6
		else
			if !dashing
				hspeed = 0
			
		// jumpin
		if key_jump_press && instance_place(x,y + 5,obj_solid) // ground
		{
			if key_up
				vspeed = -9
			else
				vspeed = -7
				
			if !(instance_place(x,y + 10,obj_airjump) || instance_place(x,y,obj_airjump))
				audio_play_sound(sfx_jump,1,0)
				
			beginjump = 1
			image_index = 0
		}
		if key_jump_press && (instance_place(x,y + 10,obj_airjump) || instance_place(x,y,obj_airjump))
		{
			audio_play_sound(sfx_airjump,1,0)
			
			if key_up
				vspeed = -11
			else
				vspeed = -9
			
			dash_charge = 1
			beginjump = 1
			image_index = 0
		}
		if key_jump_press && (instance_place(x,y + 10,obj_rightdraft) || instance_place(x,y,obj_rightdraft)) && !instance_place(x,y+2,obj_solid)
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
		if key_attack_press && dash_charge = 1 && use_dash > 0
		{
			if key_right
				hspeed = 9
			else
			if key_left
				hspeed = -9
			else
			hspeed = 0
			
			if use_dash > 1
			{
				if key_up
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
		if key_left_press || key_right_press
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
		if use_gp && !pounding && !instance_place(x,y+5,obj_solid) && key_down_press
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
		//louchester anims
		if campaign = 3
		{
			if onground
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
		if key_jump
		{
			if vspeed < 1
				vspeed += 0.2
			else if vspeed > 1
				vspeed -= 0.2
		}
		else
		{
			if vspeed < 3
				vspeed += 0.2
		}
		
		
		// walkin
		if key_up && !dashing && onground
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
			if key_right && !dashing
			{
				hspeed = 4
				facing = 1
			}
			else 
			if key_left && !dashing
			{
				hspeed = -4
				facing = -1
			}
			else
				if !dashing
					hspeed = 0
		}
			
		// jumpin
		if key_jump_press && (instance_place(x,y + 5,obj_solid) || instance_place(x,y + 5,obj_slope) || coyote_time || jumps > 0) // ground
		{
			if key_up && jumpcharge > 30
			{
				vspeed = -10
				jumpcharge = 0
				jump_charged = 1
				coyote_time = 0
			}
			else
				vspeed = -7
				
			if !(instance_place(x,y + 10,obj_airjump) || instance_place(x,y,obj_airjump))
				audio_play_sound(sfx_jump,1,0)
				
			beginjump = 1
			jumping = 1
			image_index = 0
			jumps--
		}
		if jumping && !key_jump && use_varjump
		{
			vspeed = -3
			jumping = 0
		}
		
		if coyote_time
			jumps = 2
		else
			if !onground && jumps = 2
				jumps = 1
		if instance_place(x,y + 5,obj_solid) || instance_place(x,y + 5,obj_slope)
			jumps = 1
				
		// dashin
		//if keyboard_check_pressed(cont_attack) && dash_charge = 1
		//{
		//	if key_right
		//		hspeed = 9
		//	else
		//	if key_left
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
		if key_left_press || key_right_press
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
		if key_down_press && !onground
			state = playerstate.balloon_pound
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
		
		if key_jump
		{
			state = idlestate
			vspeed = -5
		}
		
	}
	break;
	
	case playerstate.water_jump:
	{
		if beginjump
			sprite_index = spr_playerLS_fishlaunchstart
		else
			sprite_index = spr_playerLS_fishlaunch
		
		if key_right
			hspeed = 3
		else 
		if key_left
			hspeed = -3
		else
			hspeed = 0
			
		if vspeed < 15
			vspeed += 0.3
			
		if instance_place(x,y+1,obj_solid) || instance_place(x,y+1,obj_slope)
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
		
		if abs(hspeed) < 3 && abs(vspeed) < 7 && instance_place(x,y+5,obj_solid) && state != -1
		{
			state = -1
			visible = 0
			rot = 0
			speed = 0
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
		}
			
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
			if onground
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
		if key_right && !dashing
			hspeed = lerp(hspeed,6,0.05)
		else 
		if key_left && !dashing
			hspeed = lerp(hspeed,-6,0.05)
		else
			if !dashing
				hspeed = lerp(hspeed,0,0.025)
			
		// jumpin
		if key_jump_press && (instance_place(x,y + 5,obj_solid) || instance_place(x,y + 5,obj_slope) || coyote_time) // ground
		{
			if key_up && jumpcharge > 15
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
			coyote_time = 0
		}
		if jumping && !key_jump && use_varjump
		{
			vspeed = -3
			jumping = 0
		}
		
				
		//dashin
		if key_attack_press && dash_charge = 1 && (key_left || key_right)
		{
			if key_right
				if hspeed < 8
					hspeed = 9
				else
					hspeed += 1.5
			else
			if key_left
				if hspeed > -8
					hspeed = -9
				else
					hspeed += -1.5
			
			vspeed = -2
			dashing = 1
			dash_charge = 0
			beginjump = 1
			image_index = 0
		}
		
		// dash end
		if (key_left_press && facing = 1) || (key_right_press && facing = -1)
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
		if use_gp && !pounding && !instance_place(x,y+5,obj_solid) && key_down_press
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
	
	case playerstate.lava_hurt:
	{
		sprite_index = spr_playerLS_pain
		
		if key_right
			hspeed = 5
		else 
		if key_left
			hspeed = -5
		else
			hspeed = 0
			
		if vspeed < 15
			vspeed += 0.3
			
		if instance_place(x,y+1,obj_solid) || instance_place(x,y+1,obj_slope)
			state = idlestate
			
		taunt_qualify = 0
	}
	break;
	
	case playerstate.cart:
	{
		x = bound_obj.x
		y = bound_obj.y
	}
	break;
	
	case playerstate.swim:
	{
		var hsp, vsp
		
		if key_right
		{
			hsp = 4
			facing = 1
		}
		else if key_left
		{
			hsp = -4
			facing = -1
		}
		else
			hsp = 0
			
		if key_down
			vsp = 4
		else if key_up
			vsp = -4
		else
			vsp = 0
		
		hspeed = lerp(hspeed,hsp,0.05)
		vspeed = lerp(vspeed,vsp,0.05)
		
		if !instance_place(x,y,obj_swimwater)
		{
			state = idlestate
			if key_jump
				vspeed = -9
			else
				vspeed = -6
		}
		
		if key_attack_press || key_jump_press
		{
			if key_right
				if hspeed < 4
					hspeed = 5
				else
					hspeed += 1
			else if key_left
				if hspeed > -4
					hspeed = -5
				else
					hspeed -= 1
			
			
			if key_down
				if vspeed < 4
					vspeed = 5
				else
					vspeed += 1
			else if key_up
				if vspeed > -4
					vspeed = -5
				else
					vspeed -= 1
			vspeed = clamp(vspeed,-7,7)
		}
		
		if abs(hspeed) > 4.5 || abs(vspeed) > 4.5
		{
			instance_create_depth(x + (40 * sign(hspeed)),y,-1,obj_dash_hitbox)
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
		}
	}
	break;
	
	case playerstate.balloon_pound:
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
		
		vspeed = 10
		
		if key_right
			hspeed = 4
		else if key_left
			hspeed = -4
		else
			hspeed = 0
			
		if onground
			state = playerstate.balloon_normal
			
		instance_create_depth(x,y,depth,obj_dash_hitbox_u)
	}
	break;
}

if taunt_qualify && key_taunt_press && !instance_exists(obj_hitstun)
	player_taunt()

get_inputs(0)