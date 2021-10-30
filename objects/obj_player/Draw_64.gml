

//draw_text(10,10,"use_varjump: " + string(use_varjump))
//draw_text(10,25,"roomname: " + room_get_name(room))
//draw_text(10,40,"deaths: " + string(deaths))
//draw_text(10,55,"hp: " + string(hp))
//draw_text(10,70,"score: " + string(score))

draw_sprite_ext(spr_fade,0,0,0,1000,1000,0,c_black,fade_amount)

if debug 
{
	var cam = view_camera[0]
	var cx = camera_get_view_x(cam)
	var cy = camera_get_view_y(cam)
	draw_rectangle_color(790,0,1280,100,c_black,c_black,c_black,c_black,0)
	draw_text(800,10,"player coord: " + string(x) + "," + string(y) + "; cam coord: " + string(cx) + "," + string(cy))
	draw_text(800,25,"player state: " + string(state) + "; player idlestate: " + string(idlestate) + "; player statesave: " + string(statesave))
	draw_text(800,40,"roomname: " + room_get_name(room) + " [" + string(room) + "]")
	draw_text(800,55,"player hsp: " + string(hspeed) + "; player vsp: " + string(vspeed))
}