ini_open("savedata.lmao")
alarm[0] = 200

_time = 0

display_logo = 1
disp_state = 0
selector_targetheight = 350
selector_height = 350
selector_target_x = 450
selector_x = 450

sfx_vol = ini_read_real("settings","sfx_vol",1)
mu_vol = ini_read_real("settings","mu_vol",1)
use_varjump = ini_read_real("settings","varjump",1)
hitstun_enable = ini_read_real("settings","hitstun",1)
binding = 1
bind_pos = 0
bg_set = 0
prev_bg_set = 0
scroll = 0
scroll_disp = 0

hspeed = 3

