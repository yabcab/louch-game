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
	draw_text(700,175,"is_secret: " + string(is_secret) + "; is_trial: " + string(is_trial) + "; level_id: " + string(level) + "; main music: " + audio_get_name(obj_music.mu) + " [" + string(obj_music.mu) + "]")
	
	if instance_exists(obj_gms)
	{
		draw_set_alpha(0.5)
		draw_rectangle_color(690,210,1280,300,c_black,c_black,c_black,c_black,0)
		draw_set_alpha(1)
		draw_text(700,220,"ONLINE STAT")
		draw_text(700,245,"ping: [" + string(gms_info_ping()) + "]; user_id: " + string(gms_self_playerid()) + "]; user_name: [" + gms_self_name() + "]")
		draw_text(700,260,"players_online: [" + string(gms_info_login_count()) + "]; players_in_room: [" + string(instance_number(obj_other_player)) + "]")
		draw_text(700,275,"is_loggedin: [" + string(gms_info_isloggedin()) + "]; is_connected: [" + string(gms_info_isconnected()) + "]; is_responding: [" + string(gms_info_isresponding()) + "]")
	}
	
}

//rank calc
//draw_text_outlined(100,100,c_white,c_black,"RANKPERC: " + string((((score / rank_point_req) * 0.5) + ((crowncollects / crowncollecttotal) * 0.25) + ((rank_highestcombo / rank_highestcombo_req) * 0.25)) * 100) + "%",1,1)
