alarm[0] = 200
ini_open("savedata.lmao")
ini_write_real("settings","varjump",use_varjump)
ini_write_real("settings","hitstun",hitstun_enable)
ini_close()
ini_open("savedata.lmao")