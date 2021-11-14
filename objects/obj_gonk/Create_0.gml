state = 0
hspeed = 2
xs = -1
depth = -1
sound = -1
spr_dead = spr_gonk_dead
started_pause = 0
facing = 0
image_index = random_range(0,sprite_get_number(sprite_index))

if ds_list_find_value(destroy_list,id) = 1
	instance_destroy()