state = nolanstate.idle_at_place
attackstate = -1
hp = 5
hitable = 0
canhurtplayer = 0
dead = 0
goodbye_x = nolanlocation.centerarena
diff = 1
facing = 1
depth = -1

enum nolanstate {
	none = -1,
	idle_at_place,
	runaround,
}

enum nolanattacks {
	none = -1,
	bogusbox,
}

enum nolanlocation {
	centerarena = 448,
	leftarena = 160,
	rightarena = 736,
	leftoffscreen = -200,
	rightoffscreen = 992,
}

alarm[0] = 250