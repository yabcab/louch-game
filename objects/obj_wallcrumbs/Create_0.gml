switch level {
	case level_id.grass: { sprite_index = spr_wallparticles_grass } break;	
	case level_id.jungle: { sprite_index = spr_wallparticles_jungle } break;
	case level_id.space: { sprite_index = spr_wallparticles_space } break;
	case level_id.snow: { sprite_index = spr_wallparticles_snow } break;
	case level_id.beach: { sprite_index = spr_wallparticles_beach } break;
	case level_id.gaunt_grass: { sprite_index = spr_wallparticles_secret } break;	
	case level_id.gaunt_jungle: { sprite_index = spr_wallparticles_secret_jungle } break;
	case level_id.gaunt_space: { sprite_index = spr_wallparticles_secret_space } break;
	case level_id.gaunt_ice: { sprite_index = spr_wallparticles_secret_snow } break;
	case level_id.gaunt_beach: { sprite_index = spr_wallparticles_secret_beach } break;
}

image_index = irandom_range(0,sprite_get_number(sprite_index) - 1)
hspeed = (obj_player.hspeed / 2) + random_range(1,-1)