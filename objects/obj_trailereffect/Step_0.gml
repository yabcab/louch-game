if place = 1 && place2 = 0
{
	place2 = 1
	var n;
	for (n = 0; n < 75; n++)
		with instance_create_depth(random_range(bbox_left,bbox_right - 220),y,-1,obj_wallcrumbs)
		{
			hspeed = random_range(2,-2)
			vspeed = random_range(2,-2)
		}
	image_index = 1
}
if place = 2 && place2 = 1
{
	place2 = 0
	var n;
	for (n = 0; n < 75; n++)
		with instance_create_depth(random_range(bbox_left + 280,bbox_right),y,-1,obj_wallcrumbs)
		{
			hspeed = random_range(2,-2)
			vspeed = random_range(2,-2)
		}
}