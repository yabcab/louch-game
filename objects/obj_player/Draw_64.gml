

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
	draw_set_alpha(0.5)
	draw_rectangle_color(690,0,1280,110,c_black,c_black,c_black,c_black,0)
	draw_set_alpha(1)
	draw_text(700,10,"PLAYER STAT")
	draw_text(700,25,"player coord: " + string(x) + "," + string(y) + "; cam coord: " + string(cx) + "," + string(cy))
	draw_text(700,40,"player state: " + string(state) + "; player idlestate: " + string(idlestate) + "; player statesave: " + string(statesave))
	//draw_text(700,40,"roomname: " + room_get_name(room) + " [" + string(room) + "]")
	draw_text(700,55,"player hp: " + string(hp) + "; player inv: " + string(inv) + "; player invtime: " + string(invtime))
	draw_text(700,70,"player hsp: " + string(hspeed) + "; player vsp: " + string(vspeed) + "; player dir: " + string(direction) + "; player spd: " + string(speed))
	draw_text(700,85,"player sprite: " + string(sprite_get_name(sprite_index)) + "[" + string(sprite_index) + "]")
	
	draw_set_alpha(0.5)
	draw_rectangle_color(690,120,1280,200,c_black,c_black,c_black,c_black,0)
	draw_set_alpha(1)
	draw_text(700,130,"GENERAL STAT")
	draw_text(700,145,"roomname: " + room_get_name(room) + " [" + string(room) + "]; instance count: " + string(instance_count))
	draw_text(700,160,"FPS: " + string(fps) + "; FPSreal: " + string(fps_real) + "; frame_deltatime: " + string(delta_time))
	draw_text(700,175,"is_secret: " + string(is_secret) + "; is_trial: " + string(is_trial) + "; level_id: " + string(level) + "; playing music: " + audio_get_name(obj_music.mu) + " [" + string(obj_music.mu) + "]")
}