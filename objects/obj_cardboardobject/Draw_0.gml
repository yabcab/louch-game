//die
var i;
var spr_h = sprite_get_height(sprite_index)
var spr_w = sprite_get_width(sprite_index)
for (i = 0; i < spr_h; i++)
	draw_sprite_part(sprite_index,image_index,0,spr_h - i,spr_w,1,x + (slant_offset * i),y - (i * image_yscale))