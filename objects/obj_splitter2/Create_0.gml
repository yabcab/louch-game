state = 0
xs = 1
depth = -1
sound = -1
spr_dead = spr_dave_death
started_pause = 0
facing = 0
jumpstart = 0
onground = 0
image_index = random_range(0,sprite_get_number(sprite_index))
image_blend = c_blue
hurt = 1

if ds_list_find_value(destroy_list,id) = 1
	instance_destroy()