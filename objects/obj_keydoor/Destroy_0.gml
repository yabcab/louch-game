if !silent
{
	var lay_id = layer_get_id("Tiles_2")
	var t_id = layer_tilemap_get_id(lay_id)

	var i;
	var i_2;
	var crumbs;

	if layer_exists(lay_id)
	{
		for (i = 0; i < image_xscale * 32; i++)
			for (i_2 = 0; i_2 < image_yscale * 32; i_2++)
				tilemap_set_at_pixel(t_id,0,x + i,y + i_2)
	}
		
	for (crumbs = 0; crumbs < (image_xscale * image_yscale * 3); crumbs++)
		instance_create_depth(x + random_range(0,image_xscale * 32),y + random_range(0,image_yscale * 32),depth,obj_wallcrumbs)

	audio_play_sound(sfx_wallbreak,1,0)
}