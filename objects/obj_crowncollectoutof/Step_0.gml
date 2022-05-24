vspeed = lerp(vspeed,0,0.05)
if vspeed > -0.025
{
	xs -= 0.05
	ys -= 0.05
}
	
if xs <= 0
	instance_destroy()
