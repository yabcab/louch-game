audio_stop_sound(mu_disclaimer)
pal_swap_init_system(shd_pal_swapper)
draw_set_font(fnt_text)
gamepad_set_axis_deadzone(0,0.35)

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
globalvar can_pause; can_pause = 0
globalvar score_font; score_font = font_add_sprite_ext(spr_scorenumbers,"0123456789:",0,0)
globalvar combo_font; combo_font = font_add_sprite_ext(spr_combonumbers,"0123456789",0,0)

audio_group_load(audio_sfx)
audio_group_load(audio_mu)
ini_open("savedata.lmao")
globalvar sfx_vol; sfx_vol = ini_read_real("settings","sfx_vol",0.5)
globalvar mu_vol; mu_vol = ini_read_real("settings","mu_vol",0.2)
audio_group_set_gain(audio_mu,mu_vol,0)
audio_group_set_gain(audio_sfx,sfx_vol,0)
if ini_read_real("settings","fullscreen",1)
	window_set_fullscreen(1)
ini_close()

ini_open("savedata.lmao")
globalvar cont_left; cont_left = ini_read_real("settings","bind_left",vk_left)
globalvar cont_right; cont_right = ini_read_real("settings","bind_right",vk_right)
globalvar cont_up; cont_up = ini_read_real("settings","bind_up",vk_up)
globalvar cont_down; cont_down = ini_read_real("settings","bind_down",vk_down)
globalvar cont_jump; cont_jump = ini_read_real("settings","bind_jump",ord("Z"))
globalvar cont_attack; cont_attack = ini_read_real("settings","bind_attack",ord("X"))
globalvar cont_taunt; cont_taunt = ini_read_real("settings","bind_taunt",ord("C"))

globalvar use_dash; use_dash = 0
globalvar use_gp; use_gp = 0
globalvar use_varjump; use_varjump = ini_read_real("settings","varjump",1)
globalvar debug; debug = 0
globalvar hitstun_enable; hitstun_enable = ini_read_real("settings","hitstun",1)
campaign = 3
playerspr = spr_player_ls
globalvar destroy_list;
destroy_list = ds_list_create()

globalvar bpm_map; bpm_map = []
bpm_map[mu_c3area1] = 145
bpm_map[mu_tutorial] = 100
bpm_map[mu_hub] = 120
bpm_map[mu_secret] = 120
bpm_map[mu_timetrial] = 160
bpm_map[mu_escapesecret] = 160
bpm_map[mu_jungle] = 135
bpm_map[mu_space] = 145 //placeholder

room_goto(rm_gameintro)
randomize()
ini_close()