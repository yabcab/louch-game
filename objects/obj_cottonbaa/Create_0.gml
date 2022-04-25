state = 0
hspeed = 2
xs = -1
depth = -1
sound = -1
wait = 0
spr_dead = spr_bella_dead
started_pause = 0
facing = 0
onground = 0
image_index = random_range(0,sprite_get_number(sprite_index))
waking = 0

if ds_list_find_value(destroy_list,id) = 1
	instance_destroy()