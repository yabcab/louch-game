vspeed += 0.15
image_angle += abs(hspeed) * (sign(hspeed) * -1)
if y > room_height
	instance_destroy()
	
if effect
{
	var s = sprite_index
	var _xs = image_xscale
	var i = image_index
	var ia = image_angle
	with instance_create_depth(x,y,depth + 1,obj_trail)
	{
		image_speed = 0
		startfade = 1
		sprite_index = s
		image_index = i
		image_xscale = _xs
		image_angle = ia
	}
}
if speed = 0
	instance_destroy()

if byebye 
	image_alpha -= 0.05
if image_alpha < 0
	instance_destroy()