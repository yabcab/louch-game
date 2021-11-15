depth = 0
sprite_index = choose(spr_apple,spr_popsiclecol,spr_cracker)
if ds_list_find_value(destroy_list,id) = 1
	instance_destroy()