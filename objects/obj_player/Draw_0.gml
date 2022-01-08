var shd = shader_current()
pal_swap_set(spr_playerpalette,paletteselect,0)
draw_sprite_ext(sprite_index,image_index,x,y,xs * facing,ys,rot,image_blend,alph)
shader_set(shd)

//lol no
if debug
	draw_text(x - 50, y - 64,string(state) + "  " + string(idlestate) + "  " + string(statesave))
	
draw_set_font(fnt_text)
draw_text_outlined(x - (string_width(name) / 2),y - 48,c_white,c_black,name,1,1)
draw_set_color(c_white)

if instance_place(x,y,obj_palselect) 
	draw_sprite_ext(spr_uparrow,0,x,y - 64,1,1,0,c_white,1)