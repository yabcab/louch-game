if obj_player.nonstunstate = playerstate.boost
	var boost = 1
else
	var boost = 0
if obj_player.entered_door
	var door = 0
else
	var door = 1

target_x = obj_player.x + obj_player.hspeed * 23 + (obj_player.facing * 15) + (boost * 50 * obj_player.facing)
target_y = obj_player.y //+ obj_player.vspeed * 5
target_chargescroll = obj_player.key_up * obj_player.onground * -85 * door

if pause_state != pausestate.playerpause && !instance_exists(obj_hitstun)
{
	if abs(x - target_x) > 1
		x += (target_x - x) / 20
	else
		x = target_x

	//if abs(yy - target_y) > 1
	//	yy += (target_y - yy) / 10
	//else
	//	yy = target_y
	yy = target_y
		
	if abs(chargescroll - target_chargescroll) > 1
		chargescroll += (target_chargescroll - chargescroll) / 35
	else
		chargescroll = target_chargescroll
	
	y = yy + chargescroll
}