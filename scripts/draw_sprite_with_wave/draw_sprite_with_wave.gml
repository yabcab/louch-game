function draw_sprite_with_wave(_x,_y,_sprite_index,_subimg,vert,stretch,intensity,time,drag,blend){
	var spr_w = sprite_get_width(_sprite_index)
	var spr_h = sprite_get_height(_sprite_index)
	var xoff = sprite_get_xoffset(_sprite_index)
	var yoff = sprite_get_yoffset(_sprite_index)
	var portion = 0
	if vert && !stretch
		for (portion = 0; portion < spr_w; portion++)
		{
			var wave = sin((time + portion) / drag) * intensity
			draw_sprite_part(_sprite_index,_subimg,portion,0,1,spr_h,_x + portion - xoff,_y + wave - yoff)
		}
	if !vert && stretch
		for (portion = 0; portion < spr_w; portion++)
		{
			var wave = sin((time + portion) / drag) * intensity
			if intensity < 10
				draw_sprite_part(_sprite_index,_subimg,portion,0,drag / intensity,spr_h,_x + portion + wave - xoff,_y - yoff)
			else
				draw_sprite_part(_sprite_index,_subimg,portion,0,((spr_w / (drag + 2)) * intensity) / drag,spr_h,_x - xoff + portion + wave,_y - yoff)
			
		}
	if vert && stretch
		for (portion = 0; portion < spr_w; portion++)
		{
			var wave = sin((time + portion) / drag) * intensity
			if intensity < 10
				draw_sprite_part(_sprite_index,_subimg,portion,0,drag / intensity,spr_h,_x + portion + wave - xoff,_y + wave - yoff)
			else
				draw_sprite_part(_sprite_index,_subimg,portion,0,((spr_w / (drag + 2)) * intensity) / drag,spr_h,_x + portion + wave - xoff,_y + wave - yoff)
		}
}