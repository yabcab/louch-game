globalvar use_dash; use_dash = 0
globalvar use_gp; use_gp = 0
campaign = 3
playerspr = spr_player_ls
obj_player.sprite_index = spr_player_ls
if !audio_is_playing(mu_timetrial)
	audio_play_sound(mu_timetrial,1,1)
draw_set_font(fnt_text)