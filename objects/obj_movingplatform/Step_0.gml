if instance_exists(obj_player)
{
	if instance_exists(obj)
	{
		instance_destroy(obj)
	}
	if !instance_exists(obj) && obj_player.bbox_bottom < y
	{
		var s = image_xscale
		obj = instance_create_depth(x,y,depth,obj_platsolid)
		with obj
			image_xscale = s
	}
}

if distance_to_object(obj_player) < 2 && obj_player.onground && obj_player.vspeed >= 0
{
	obj_player.x += hspeed
	obj_player.vspeed = 0
	obj_player.y += vspeed
}

if instance_place(x + hspeed,y,obj_enemyturn)
	hspeed *= -1
if instance_place(x,y + vspeed + 100,obj_enemyturn) || instance_place(x,y + vspeed,obj_enemyturn)
	vspeed *= -1