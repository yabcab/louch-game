alarm[0] = 200
ini_open("savedata.lmao")
audio_group_set_gain(audio_sfx,sfx_vol,0)
ini_write_real("settings","varjump",use_varjump)
ini_write_real("settings","hitstun",hitstun_enable)
ini_close()
ini_open("savedata.lmao")