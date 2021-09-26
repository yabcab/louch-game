while place_meeting(x, y + abs(hspeed) + 1, obj_slope) && !place_meeting(x, y + 1, obj_slope) && !instance_place(x,y+1,obj_solid)
	y += 0.1
	
x = round(x)
y = round(y)

if pause_state = pausestate.playerpause
{
	if !started_pause
		pause_player_init()
	else
		pause_player_keep()
}
else
	if started_pause
		pause_player_end()
		
if campaign = 1
	sprite_index = spr_player
if campaign = 2
	sprite_index = spr_player_ls