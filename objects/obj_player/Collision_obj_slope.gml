if state = playerstate.dying
{
	if instance_place(x,y+vspeed,obj_slope)
	{
		if abs(vspeed) > 1
			audio_play_sound(choose(sfx_bonk,sfx_hitwall1,sfx_hitwall2,sfx_hitwall3,sfx_hitwall4,sfx_hitwall5),1,0)
		if vspeed > 0
			vspeed *= -1
		vspeed += 1.5
	}
	if instance_place(x,y-vspeed,obj_slope)
	{
		if vspeed > 0
			vspeed *= -1
	}
	
	if speed < 0.1
		instance_destroy()
}

if state != playerstate.noclip
{
	if (instance_place(x,y + vspeed,obj_slope))
	{
		if (vspeed<=0){move_contact_solid(90,abs(vspeed));}
		if (vspeed>0){move_contact_solid(270,abs(vspeed));}
		vspeed=0;
	}
	if place_meeting(x + hspeed,y - 1 * grav,obj_solid) && place_meeting(x + hspeed,y - 13 * grav,obj_solid)
	{
		if (hspeed<=0){move_contact_solid(180,abs(hspeed));}
		if (hspeed>0){move_contact_solid(0,abs(hspeed));}
		hspeed=0;
	}
}

if sign(other.image_yscale) = grav
{
	while place_meeting(x + hspeed, y, obj_slope)
	{
		y -= 0.1 * grav
	}
}
else
{
	vspeed = 0
	while place_meeting(x + hspeed, y + 1 * grav, obj_slope)
	{
		y += 0.1 * grav
	}
}


// dash
if instance_place(x,y+3 * grav,obj_slope)
{
	dash_charge = 1
	pounding = 0
}
if !instance_place(x,y-1 * grav,obj_slope)
	dashing = 0
	
if state = playerstate.hurt && hurttime > 10
{
	state = idlestate
	hurttime = 0
}
	
if state = playerstate.balloon_dash && instance_place(x,y+1 * grav,obj_slope)
	state = idlestate
	
