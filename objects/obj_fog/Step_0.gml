image_angle += spin_spd * spin_dir
speed += 0.05
image_alpha -= 0.01

if image_alpha < 0
	instance_destroy()