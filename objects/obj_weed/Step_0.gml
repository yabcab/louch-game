if instance_place(x,y+1,obj_solid) || instance_place(x,y + 3,obj_slope) || instance_place(x,y+1,obj_platform)
	onground = 1
else
	onground = 0

while place_meeting(x + hspeed, y + 0.1, obj_slope)
{
	y -= 0.1
}
while place_meeting(x, y + abs(hspeed) + 1, obj_slope) && !place_meeting(x, y + 1, obj_slope)
{
	y += 0.1
}
switch state {
	case 0: 
	{
		if vspeed < 15
			vspeed += 0.3
			
		if (instance_place(x + hspeed,y,obj_solid) && instance_place(x + hspeed,y - 12,obj_solid))
		{
			hspeed = -hspeed
			xs = -xs
		}
		
		if onground
			image_speed = 1 + abs(hspeed / 2)
		else
			image_speed = 1
		
		if instance_exists(obj_player)
		{
			if x > obj_player.x
			{
				if hspeed > (target_hspeed * -1)
					hspeed -= 0.15
				xs = -1
			}
			else
			{
				if hspeed < target_hspeed
					hspeed += 0.15
				xs = 1
			}
		}
		else
			hspeed = lerp(hspeed,4 * xs,0.05)
		
		if onground
			sprite_index = spr_dave_run
		else
			if jumpstart
				sprite_index = spr_dave_jump
			else
				sprite_index = spr_dave_fall
	}
	break;
}

var s = sprite_index
var _xs = xs
var i = image_index
with instance_create_depth(x,y,depth + 1,obj_trail)
{
	image_speed = 0
	startfade = 1
	sprite_index = s
	image_index = i
	image_xscale = _xs
}

if pause_state != pausestate.none
{
	if !started_pause
		pause_player_init()
	else
		pause_player_keep()
}
else
	if started_pause
		pause_player_end()
		
