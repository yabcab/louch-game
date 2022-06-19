//die
//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,0)

var i;
var spr_h = sprite_get_height(sprite_index)
var spr_w = sprite_get_width(sprite_index)
var spr_o = sprite_get_xoffset(sprite_index)
for (i = 0; i < spr_h; i++)
	draw_sprite_part_ext(sprite_index,image_index,0,spr_h - i,spr_w,1,x + (slant_offset * i) - spr_o,y - (i * image_yscale),1,1,make_color_hsv(0,0,255 - (i * slant_offset * 3)),image_alpha)