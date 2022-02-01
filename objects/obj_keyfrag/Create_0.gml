collected = 0
following = 0
yoff = 0
_time = random_range(0,1000)
keynumb = 0
fragnumb = 0

depth = -1

if ds_list_find_value(destroy_list,id) = 1
	instance_destroy()
	
image_blend = c_purple