var secret = is_secret

if secret
{
	switch level {
		case level_id.grass: { sprite_index = spr_wallparticles_secret } break;	
		case level_id.jungle: { sprite_index = spr_wallparticles_secret_jungle } break;
		case level_id.space: { sprite_index = spr_wallparticles_secret_space } break;
	}
}
else
{
	switch level {
		case level_id.grass: { sprite_index = spr_wallparticles_grass } break;	
		case level_id.jungle: { sprite_index = spr_wallparticles_jungle } break;
		case level_id.space: { sprite_index = spr_wallparticles_space } break;
	}
}

if secret
	image_index = random_range(0,5)
else
	image_index = random_range(0,4)
hspeed = (obj_player.hspeed / 2) + random_range(1,-1)