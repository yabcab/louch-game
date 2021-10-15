audio_stop_sound(mu_disclaimer)
pal_swap_init_system(shd_pal_swapper)
draw_set_font(fnt_text)

globalvar campaign; campaign = 0
globalvar playerspr; playerspr = spr_player
globalvar gotsecret; gotsecret = 0
globalvar time; time = 0
globalvar deaths; deaths = 0
globalvar keys; keys = 0
globalvar levelmusic; levelmusic = mu_hub
globalvar is_secret; is_secret = 0
globalvar is_trial; is_trial = 0
globalvar pause_state; pause_state = pausestate.none
globalvar level_complete; level_complete = 0
globalvar level; level = 0

globalvar use_dash; use_dash = 0
globalvar use_gp; use_gp = 0
campaign = 3
playerspr = spr_player_ls
globalvar destroy_list;
destroy_list = ds_list_create()

room_goto(rm_hub1)