alarm[0] = 200
audio_group_set_gain(audio_sfx,sfx_vol,0)
audio_group_set_gain(audio_mu,mu_vol,0)
ini_write_real("settings","varjump",use_varjump)
ini_write_real("settings","hitstun",hitstun_enable)
ini_close()
ini_open("savedata.lmao")