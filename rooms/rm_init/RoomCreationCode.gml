draw_set_font(fnt_text)
gamepad_set_axis_deadzone(0,0.45)
pal_swap_init_system(shd_pal_swapper)
randomize()

//globalinits
globalvar campaign; campaign = 3
globalvar playerspr; playerspr = spr_player_ls
globalvar gotsecret; gotsecret = 0
globalvar time; time = 0
globalvar deaths; deaths = 0
globalvar keys; keys = 0
globalvar levelmusic; levelmusic = mu_hub
globalvar is_secret; is_secret = 0
globalvar is_trial; is_trial = 0
globalvar is_timetrial; is_timetrial = 0
globalvar pause_state; pause_state = pausestate.none
globalvar level_complete; level_complete = 0
globalvar level; level = 0
globalvar can_pause; can_pause = 0
globalvar score_font; score_font = font_add_sprite_ext(spr_scorenumbers,"0123456789:AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz.!?/%[]",0,0)
globalvar combo_font; combo_font = font_add_sprite_ext(spr_combonumbers,"0123456789",0,0)
globalvar freezetimerfont; freezetimerfont = font_add_sprite_ext(spr_freezetimernumbers,"0123456789:",0,0)
globalvar dwidth; dwidth = 1920
globalvar dheight; dheight = 1080
globalvar operate_on_savedata; operate_on_savedata = 0
globalvar crownsseen; crownsseen = 0
globalvar crownarray; crownarray = []
var i;
for (i = 0; i < 99; i++)
	crownarray[i] = 0
globalvar roombounds; roombounds = 1
globalvar performance_mode; performance_mode = 0

globalvar crowncollects; crowncollects = 0
globalvar crowncollecttotal; crowncollecttotal = 0
globalvar rank_point_req; rank_point_req = 0
globalvar rank_got_specialgoal; rank_got_specialgoal = 0
globalvar rank_do_specialgoal; rank_do_specialgoal = 0
globalvar rank_highestcombo; rank_highestcombo = 0
globalvar rank_highestcombo_req; rank_highestcombo_req = 0
globalvar rank_specialgoal_checkfunc; 
globalvar nodamage; nodamage = 1
rank_specialgoal_checkfunc = function() {
	//balls
}

//loading
audio_group_load(audio_sfx)
audio_group_load(audio_mu)

//savedata
ini_open("savedata.lmao")
globalvar sfx_vol; sfx_vol = ini_read_real("settings","sfx_vol",0.2)
globalvar mu_vol; mu_vol = ini_read_real("settings","mu_vol",0.2)
audio_group_set_gain(audio_mu,mu_vol,0)
audio_group_set_gain(audio_sfx,sfx_vol,0)
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
globalvar totalcrowns; totalcrowns = ini_read_real("stats","totalcrowns",0)
if ini_read_real("settings","fullscreen",1)
	window_set_fullscreen(1)

globalvar sav_beatlevel; sav_beatlevel = []
sav_beatlevel[level_id.grass] = ini_read_real("level_completion",string(level_id.grass),0)
sav_beatlevel[level_id.jungle] = ini_read_real("level_completion",string(level_id.jungle),0)
sav_beatlevel[level_id.space] = ini_read_real("level_completion",string(level_id.space),0)
sav_beatlevel[level_id.snow] = ini_read_real("level_completion",string(level_id.snow),0)
sav_beatlevel[level_id.beach] = ini_read_real("level_completion",string(level_id.beach),0)
sav_beatlevel[level_id.sky1] = ini_read_real("level_completion",string(level_id.sky1),0)

ini_close()

//destroylist
globalvar destroy_list;
destroy_list = ds_list_create()

//bpm map
globalvar bpm_map; bpm_map = []
bpm_map[mu_c3area1] = 145
bpm_map[mu_tutorial] = 100
bpm_map[mu_hub] = 120
bpm_map[mu_secret] = 120
bpm_map[mu_timetrial] = 160
bpm_map[mu_escapesecret] = 160
bpm_map[mu_jungle] = 135
bpm_map[mu_space] = 145
bpm_map[mu_icebergs] = 150
bpm_map[mu_danceparty] = 160
bpm_map[mu_credits] = 140
bpm_map[mu_playground] = 120
bpm_map[mu_beach] = 135
bpm_map[mu_mines] = 110
bpm_map[mu_sky1] = 130
bpm_map[sfx_none] = 0
bpm_map[mu_bigtrial] = 165
bpm_map[mu_gauntlet] = 165
bpm_map[mu_levelcomplete] = 120
bpm_map[500] = 0

room_goto(rm_gameintro)

if !sprite_exists(asset_get_index("Sprite89"))
	game_end()
	
display_set_gui_size(1280,720)
