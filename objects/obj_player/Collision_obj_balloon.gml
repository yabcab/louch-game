if state = idlestate
{
	state = playerstate.balloon_normal
	idlestate = playerstate.balloon_normal
}
if state = playerstate.boost
{
	state = playerstate.balloon_dash
	idlestate = playerstate.balloon_normal
}