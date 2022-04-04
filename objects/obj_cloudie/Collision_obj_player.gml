if !trialdependant || is_trial
{
	if !collected
	{
		collected = 1
		following = other.id
		//keys++
		obj_player.clouds++
		obj_player.totalcloud++
		keynumb = obj_player.totalcloud
		curr_clouds = obj_player.clouds
	}
}