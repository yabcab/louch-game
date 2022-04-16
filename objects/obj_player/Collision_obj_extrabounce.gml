balloonjumping = 1
if key_jump
	if vspeed > -10
		vspeed = -10
	else
	{
		vspeed -= 10
		vspeed = clamp(vspeed,-14,0)
	}
else
	if vspeed > -8
		vspeed = -8
	else
	{
		vspeed -= -8
		vspeed = clamp(vspeed,-14,0)
	}
	
beginjump = 1
image_index = 0
jumping = 1
jumps = 1

with other
	instance_destroy()

audio_play_sound(sfx_balloonpop,1,0)
for (i = 0; i < 50; i++)
	{
		with instance_create_depth(other.x + random_range(-15,15),other.y + random_range(-15,15),depth,obj_explosionparticle)
		{
			sprite_index = spr_balloonpopparticles
			image_index  = random_range(0,4)
			rot = choose(5,-5)
		}
	}