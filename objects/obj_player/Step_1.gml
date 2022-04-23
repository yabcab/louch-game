//if sprite_index = spr_playerLS_walk || sprite_index = spr_playerLS_high_walk
//{
//	if floor(image_index) = 0 && image_index != image_index_prev
//		with instance_create_depth(x,y,depth,obj_stillparticle)
//			sprite_index = spr_walksmoke
		
//	if floor(image_index) = 2 && image_index != image_index_prev
//		with instance_create_depth(x,y,depth,obj_stillparticle)
//			sprite_index = spr_walksmoke
//}

if state = playerstate.noclip
{
	mask_index = spr_null
	//solid = 1
}
else
{
	mask_index = collisionmask
	//solid = 1
}

if instance_place(x + hspeed,y,obj_solid) && !instance_place(x + hspeed,y - 12 * grav,obj_solid)
{
	while instance_place(x + hspeed,y + vspeed,obj_solid)
		y -= 1 * grav
}

if gamepad_button_check_pressed(0,gp_stickr)
{
	if state != playerstate.noclip
		state = playerstate.noclip
	else
		state = idlestate
}
