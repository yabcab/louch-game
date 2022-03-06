state = 0
vspeed = 2
xs = -1
yoff = 0
ysin = 0
xoff = 0
depth = -1000
sound = -1
spr_dead = spr_eye_dead
started_pause = 0
facing = 0
onscreen = 0
_time = 0
image_index = random_range(0,sprite_get_number(sprite_index))

if ds_list_find_value(destroy_list,id) = 1
	instance_destroy()