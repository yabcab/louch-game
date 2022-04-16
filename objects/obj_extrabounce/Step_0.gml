if pause_state = pausestate.none
	_time++
ysin = sin(_time / 30) * 5
xs = lerp(xs,1,0.075)
ys = lerp(ys,1,0.075)
