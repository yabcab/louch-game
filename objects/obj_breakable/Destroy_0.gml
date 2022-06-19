var lay_id = layer_get_id("Tiles_2")
var t_id = layer_tilemap_get_id(lay_id)

var i;
var i_2;
var crumbs;

if layer_exists(lay_id)
	for (i = 0; i < image_xscale * 32; i++)
		for (i_2 = 0; i_2 < image_yscale * 32; i_2++)
			tilemap_set_at_pixel(t_id,0,x + i,y + i_2)

if !silent
{
	for (crumbs = 0; crumbs < (image_xscale * image_yscale * 3); crumbs++)
		with instance_create_depth(x + random_range(0,image_xscale * 32),y + random_range(0,image_yscale * 32),-5,obj_wallcrumbs)
		{
			switch level {
			case level_id.grass: { sprite_index = spr_wallparticles_grass2; image_index = irandom_range(0,5) } break;	
			case level_id.jungle: { sprite_index = spr_wallparticles_jungle } break;
			case level_id.space: { sprite_index = spr_wallparticles_space } break;
			case level_id.snow: { sprite_index = spr_wallparticles_snow } break;
			case level_id.beach: { sprite_index = spr_wallparticles_beach } break;
			case level_id.sky1: { sprite_index = spr_wallparticles_sky } break;
			case level_id.gaunt_grass: { sprite_index = spr_wallparticles_secret } break;	
			case level_id.gaunt_jungle: { sprite_index = spr_wallparticles_secret_jungle } break;
			case level_id.gaunt_space: { sprite_index = spr_wallparticles_secret_space } break;
			case level_id.gaunt_ice: { sprite_index = spr_wallparticles_secret_snow } break;
			case level_id.gaunt_beach: { sprite_index = spr_wallparticles_secret_beach } break;
			case level_id.gaunt_sky: { sprite_index = spr_wallparticles_secret_sky } break;
			}	
		}

	audio_play_sound(sfx_wallbreak,1,0)
	
	do_camerashake(0,2.5,25)
}

ds_list_set(destroy_list,id,1)