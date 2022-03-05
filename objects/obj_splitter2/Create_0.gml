state = 0
xs = 1
depth = -1
sound = -1
spr_dead = spr_dave_death
spr_idle = spr_dave_run
spr_detach = spr_dave_jump
started_pause = 0
facing = 0
jumpstart = 0
onground = 0
image_index = random_range(0,sprite_get_number(sprite_index))
hurt = 1
splitting = 1

if ds_list_find_value(destroy_list,id) = 1
	instance_destroy()