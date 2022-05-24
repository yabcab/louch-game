depth = 0
sprite_index = choose(spr_apple,spr_popsiclecol)

if ds_list_find_value(destroy_list,id) = 1
	instance_destroy()
	
image_index = choose(0,1,2)
