if pause_state = pausestate.nonplayerpause
	pause_state = pausestate.none
	
obj_music.pitch_offset -= -0.2
layer_destroy(lay)
instance_create_depth(x,y,1,obj_whiteout)