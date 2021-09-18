if !used
{
	obj_player.spawn = spawn
	obj_player.statesave = obj_player.state
	obj_player.state = -1
	obj_player.visible = 0
	var inst = instance_create_depth(x,y,-500,obj_roomfade)
	inst.targetroom = targetroom
	used = 1
}