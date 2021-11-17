_time++

if state = 0
{
	if abs(x - targetx) > 1
			x += (targetx - x) / 10
		else
			x = targetx
	
	if abs(y - targety) > 1
			y += (targety - y) / 10
		else
			y = targety
	
	if x = targetx && y = targety
		state = 1
}
if state = 1
{
	waittimer++
	if waittimer = 50
		room_goto(targetroom)
	if waittimer = 100
		state = 2
}
if state = 2
{
	if abs(x - obj_player.x) > 1
			x += (obj_player.x - x) / 10
		else
			x = obj_player.x
	
	if abs(y - obj_player.y) > 1
			y += (obj_player.y - y) / 10
		else
			y = obj_player.y
	
	if !instance_exists(obj_secrettransition)
		instance_destroy()
}