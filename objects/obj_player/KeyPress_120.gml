if !instance_exists(obj_gms)
{
	obj_music.mu = mu_login	
	instance_create_depth(x,y,depth,obj_onlineloading)
	alarm[11] = 1
}