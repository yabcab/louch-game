var shd = shader_current()
pal_swap_set(spr_playerpalette,paletteselect,0)
draw_sprite_ext(sprite_index,image_index,x,y,xs * facing,ys,rot,image_blend,alph)
shader_set(shd)
if name = "thejabcoalt" || name = "AtmosphericSire" || name = "DouchebagCat"
	draw_text_outlined(x - (string_width(gms_self_name()) / 2),y - 48,admincol,c_black,gms_self_name(),1,1)
else if name = "Solorveno"
	draw_text_outlined(x - (string_width(gms_self_name()) / 2),y - 48,grousecol,c_black,gms_self_name(),1,1)
else
	draw_text_outlined(x - (string_width(gms_self_name()) / 2),y - 48,c_white,c_black,gms_self_name(),1,1)
draw_set_color(c_white)
if typing
	draw_text(x - (string_width(name) / 2),y - 64,"...")