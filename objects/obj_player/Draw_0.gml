var shd = shader_current()
pal_swap_set(spr_playerpalette,paletteselect,0)
if drawballoon
	draw_sprite_ext(spr_playerLS_notlouchbuttheballooninstead,obj_3framekeeper.image_index,x,y - 32,xs * facing,ys,rot,image_blend,alph)
draw_sprite_ext(sprite_index,image_index,x,y,xs * facing,ys,rot,image_blend,alph)
shader_set(shd)

//lol no
if debug
	draw_text(x - 50, y - 64,string(state) + "  " + string(idlestate) + "  " + string(statesave))

draw_set_font(fnt_text)
if instance_exists(obj_gms)
{
	if gms_self_name() = "thejabcoalt" || gms_self_name() = "AtmosphericSire" || gms_self_name() = "DouchebagCat"
		draw_text_outlined(x - (string_width(gms_self_name()) / 2),y - 48,admincol,c_black,gms_self_name(),1,1)
	else if gms_self_name() = "Solorveno"
		draw_text_outlined(x - (string_width(gms_self_name()) / 2),y - 48,grousecol,c_black,gms_self_name(),1,1)
	else
		draw_text_outlined(x - (string_width(gms_self_name()) / 2),y - 48,c_white,c_black,gms_self_name(),1,1)
	draw_set_color(c_white)
}

if instance_place(x,y,obj_palselect) || instance_place(x,y,obj_door)
	draw_sprite_ext(spr_uparrow,0,x,y - 54 - (instance_exists(obj_gms) * 10) + arrowsin,1,1,0,c_white,1)
	
