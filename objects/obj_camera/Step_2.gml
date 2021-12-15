var sx,sy
if shakex > 0
	sx = random_range(shakex * -1,shakex)
else
	sx = 0
if shakey > 0
	sy = random_range(shakey * -1,shakey)
else
	sy = 0

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
target_chargescroll = (obj_player.key_up * obj_player.onground * -85 * door) + (obj_player.key_down * obj_player.onground * 85 * door)

if pause_state != pausestate.playerpause && !instance_exists(obj_hitstun)
{
	if abs(xx - target_x) > 1
		xx += (target_x - xx) / 20
	else
		xx = target_x
		
	x = clamp(xx,320,room_width - 320) + sx

	//if abs(yy - target_y) > 1
	//	yy += (target_y - yy) / 20
	//else
	//	yy = target_y
	yy = target_y
		
	if abs(chargescroll - target_chargescroll) > 1
		chargescroll += (target_chargescroll - chargescroll) / 35
	else
		chargescroll = target_chargescroll
	
	y = clamp(yy + chargescroll,180,room_height - 180) + sy
}