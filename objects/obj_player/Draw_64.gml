

draw_text(10,10,"keys: " + string(keys))
draw_text(10,25,"roomname: " + room_get_name(room))
draw_text(10,40,"deaths: " + string(deaths))
draw_text(10,55,"hp: " + string(hp))

draw_sprite_ext(spr_fade,0,0,0,1000,1000,0,c_black,fade_amount)

if debug 
{
	var cam = view_camera[0]
	var cx = camera_get_view_x(cam)
	var cy = camera_get_view_y(cam)
	draw_text(800,10,"player coord: " + string(x) + "," + string(y) + "; cam coord: " + string(cx) + "," + string(cy))
	draw_text(800,25,"player state: " + string(state) + "; player idlestate: " + string(idlestate) + "; player statesave: " + string(statesave))
}