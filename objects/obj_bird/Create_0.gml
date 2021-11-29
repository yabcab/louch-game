state = 0
hspeed = 2
xs = -1
depth = -1
sound = -1
spr_dead = spr_feesh_dead
started_pause = 0
facing = 0
image_index = random_range(0,sprite_get_number(sprite_index))
image_blend = c_lime
_time = 0
can_egg = 0
alarm[0] = random_range(100,150)
onscreen = 0

if ds_list_find_value(destroy_list,id) = 1
	instance_destroy()