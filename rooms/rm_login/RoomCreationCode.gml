keyboard_string = ""
if instance_exists(obj_timer)
	instance_destroy(obj_timer)
if instance_exists(obj_freezetimer)
	instance_destroy(obj_freezetimer)
while instance_exists(obj_key)
	instance_destroy(obj_key)