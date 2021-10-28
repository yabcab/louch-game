if display_logo
	draw_sprite_with_wave(640,25,spr_title,0,1,0,3,_time,30,image_blend)

if disp_state = 0
{
	draw_sprite_with_wave(640,350,spr_playicon,0,1,0,3,_time,30,image_blend)
	draw_sprite_with_wave(640,475,spr_settingsicon,0,1,0,3,_time,30,image_blend)
	draw_sprite_with_wave(640,600,spr_quiticon,0,1,0,3,_time,30,image_blend)
}
if disp_state = 1
{
	draw_sprite_with_wave(640,75,spr_backfromsettings,0,1,0,3,_time,30,image_blend)
	draw_sprite_ext(spr_volslider_base,0,840,150,1,1,0,c_white,1)
	draw_sprite_ext(spr_volslider_base,0,840,275,1,1,0,c_white,1)
	draw_sprite_ext(spr_volslider_hand,0,420 + (800 * sfx_vol),150,1,1,0,c_white,1)
	draw_sprite_ext(spr_volslider_hand,0,420 + (800 * mu_vol),275,1,1,0,c_white,1)
	draw_sprite_with_wave(400,150,spr_sfxvolicon,0,1,0,3,_time,30,image_blend)
	draw_sprite_with_wave(400,275,spr_muvolicon,0,1,0,3,_time,30,image_blend)
	draw_sprite_with_wave(640,400,spr_rebindkeysicon,0,1,0,3,_time,30,image_blend)
	draw_sprite_with_wave(640,525,spr_fullscreenicon,0,1,0,3,_time,30,image_blend)
}
if disp_state = 2
{
	var spr = 0
	switch bind_pos {
		case 0: { spr = spr_pressleft } break;
		case 1: { spr = spr_pressright } break;
		case 2: { spr = spr_pressup } break;
		case 3: { spr = spr_pressdown } break;
		case 4: { spr = spr_pressjump } break;
		case 5: { spr = spr_pressattack } break;
		case 6: { spr = spr_presstaunt } break;
	}
	draw_sprite_with_wave(640,360,spr,0,1,0,3,_time,30,image_blend)
}
//draw_text(10,500,string(selector_targetheight))
draw_sprite_ext(spr_cursor,0,selector_x,selector_height + sin(_time / 10) * 3,2,2,0,c_white,1)