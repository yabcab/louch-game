switch type {
	case 0:
	{
		if obj_bogus.attackstate = nolanattacks.bogusbox
			instance_create_depth(random_range(bbox_left,bbox_right),y,101,obj_bogusbox)
	}
	break;
	
	case 1:
	{
		barreltime--
		if obj_bogus.attackstate = nolanattacks.bogusbox && obj_bogus.diff > 1 && barreltime < 0
		{
			barreltime = random_range(50,150)
			with instance_create_depth(random_range(bbox_left,bbox_right),y,101,obj_bogusboxfloor)
				hspeed = 3 * other.image_xscale
		}
	}
	break;
}

alarm[0] = 30