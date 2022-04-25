if drawballoon
	draw_sprite_ext(spr_playerLS_notlouchbuttheballooninstead,obj_3framekeeper.image_index,x,y - 32,xs * facing,ys,rot,image_blend,alph)
var shd = shader_current()
pal_swap_set(spr_playerpalette,paletteselect,0)
draw_sprite_ext(sprite_index,image_index,x,y,xs * facing,ys,rot,image_blend,alph)
shader_set(shd)
if hat != 0
	draw_sprite_ext(spt_hats,hat,x,y - 32 + hatsin,1,1,0,c_white,alph)
if name = "thejabcoalt" || name = "AtmosphericSire" || name = "DouchebagCat"
	draw_text_outlined(x - (string_width(name) / 2),y - 48,admincol,c_black,name,1,1)
else if name = "Solorveno"
	draw_text_outlined(x - (string_width(name) / 2),y - 48,grousecol,c_black,name,1,1)
else
	draw_text_outlined(x - (string_width(name) / 2),y - 48,c_white,c_black,name,1,1)
draw_set_color(c_white)
if typing
	draw_text(x - (string_width(name) / 2),y - 64,"...")