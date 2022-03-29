depth = 0
image_index = choose(0,1)
if ds_list_find_value(destroy_list,id) = 1
	instance_destroy()
	
_time = irandom_range(0,300)
yoff = 0
collected = 0