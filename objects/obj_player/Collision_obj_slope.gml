if state = playerstate.dying
{
	if instance_place(x+hspeed,y,obj_slope)
	{
		if hspeed < 0
			hspeed += 2
		else
			hspeed -= 2
		hspeed *= -1
		audio_play_sound(choose(sfx_bonk,sfx_hitwall1,sfx_hitwall2,sfx_hitwall3,sfx_hitwall4,sfx_hitwall5),1,0)
	}
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
}

if !instance_place(x,y+1,obj_slope)
{
	if (instance_place(x+hspeed,y,obj_solid))
	{
		if (hspeed<=0){move_contact_solid(180,abs(hspeed));}
		if (hspeed>0){move_contact_solid(0,abs(hspeed));}
		if !instance_place(x,y+1,obj_slope)
			hspeed=0;
	}
	if (instance_place(x,y+vspeed,obj_solid))
	{
		if (vspeed<=0){move_contact_solid(90,abs(vspeed));}
		if (vspeed>0){move_contact_solid(270,abs(vspeed));}
		vspeed=0;
	}
	if (instance_place(x+hspeed,y+vspeed,obj_solid))
	{
		hspeed=0;
	}
}
vspeed = 0
while place_meeting(x, y + 0.1, obj_slope)
{
	y -= 0.1
}
while place_meeting(x, y + abs(hspeed) + 1, obj_slope) && !place_meeting(x, y + 0.1, obj_slope)
{
	y += 0.1
}
if instance_place(x + hspeed,y,obj_solid)
{
	var inst = instance_place(x + hspeed,y + 1,obj_solid)
	y = inst.y - 33
}

// dash
if instance_place(x,y+3,obj_slope)
{
	dash_charge = 1
	pounding = 0
}
if !instance_place(x,y-1,obj_slope)
	dashing = 0
	
if state = playerstate.hurt && (instance_place(x,y+1,obj_slope) || instance_place(x+1,y,obj_slope) || instance_place(x-1,y,obj_slope)) && hurttime > 10
{
	state = idlestate
	hurttime = 0
}
	
if state = playerstate.balloon_dash && instance_place(x,y+1,obj_slope)
	state = idlestate
	
