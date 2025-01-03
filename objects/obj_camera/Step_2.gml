_time++
var cam = view_camera[0]

if obj_player.nonstunstate = playerstate.boost
	var boost = 1
else
	var boost = 0
if obj_player.entered_door
	var door = 0
else
	var door = 1

target_x = obj_player.x + (obj_player.facing * 20) + (boost * 50 * obj_player.facing) + obj_player.hspeed * 20
target_y = obj_player.y //+ obj_player.vspeed * 23
target_chargescroll = (obj_player.key_up * obj_player.onground * -85 * door)

if pause_state != pausestate.playerpause && !instance_exists(obj_hitstun)
{
	#region pos
	if camboby
		ybob = sin(_time / 50) * 10
	else
		ybob = 0
	
	if cambobx
		xbob = sin(_time / 50) * 10
	else
		xbob = 0
	
	if abs(xx - target_x) > 1
		xx += (target_x - xx) / 20
	else
		xx = target_x
		
	if abs(xoff - xoff_t) > 1
		xoff += (xoff_t - xoff) / 35
	else
		xoff = xoff_t
		
	x = lerp(x,xx + xbob + xoff + shake_x,0.3)

	//if abs(yy - target_y) > 1
	//	yy += (target_y - yy) / 20
	//else
	//	yy = target_y
	yy = target_y
		
	if abs(chargescroll - target_chargescroll) > 1
		chargescroll += (target_chargescroll - chargescroll) / 35
	else
		chargescroll = target_chargescroll
	
	y = lerp(y,yy + chargescroll + shake_y + ybob,0.3)
	#endregion
	
	#region zooms
	if abs(zoomx - zoomx_target) > 1
		zoomx += (zoomx_target - zoomx) / 20
	else
		zoomx = zoomx_target
		
	if abs(zoomy - zoomy_target) > 1
		zoomy += (zoomy_target - zoomy) / 20
	else
		zoomy = zoomy_target
	
	if room != rm_login
		camera_set_view_size(cam,zoomx,zoomy)
	#endregion
	
	#region angle
	if abs(angle - targetangle) > 0.01
		angle += clamp((targetangle - angle) / 10,-5,5)
	else
		angle = targetangle
		
	camera_set_view_angle(cam,angle)
	#endregion
	
	#region shake
	if camerashake
	{
		shake_x = random_range(-shake_x_int,shake_x_int)
		shake_y = random_range(-shake_y_int,shake_y_int)
	}
	else
	{
		shake_x = 0
		shake_y = 0
	}
	#endregion
}

if !roombounds
{
	camera_set_view_pos(view_camera[0],x - 320,y - 180)
	camera_set_view_target(view_camera[0],noone)
}
else
	camera_set_view_target(view_camera[0],oldtarget)

if newroom
{
	x = obj_player.x + (obj_player.facing * 20)
	xx = obj_player.x + (obj_player.facing * 20)
	y = obj_player.y
	newroom = false
}