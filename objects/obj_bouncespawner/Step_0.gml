if waiting > -1 && pause_state != pausestate.playerpause
	waiting--

if waiting = 0
	instance_create_depth(x,y,depth,obj_extrabounce)

if !instance_place(x,y,obj_extrabounce) && waiting = -1
	waiting = 150