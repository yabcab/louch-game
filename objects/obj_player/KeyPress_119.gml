ini_open("savedata.lmao")
ini_write_real("settings","bind_left",vk_left)
ini_write_real("settings","bind_right",vk_right)
ini_write_real("settings","bind_up",vk_up)
ini_write_real("settings","bind_down",vk_down)
ini_write_real("settings","bind_jump",ord("Z"))
ini_write_real("settings","bind_attack",ord("X"))
ini_write_real("settings","bind_taunt",ord("C"))

cont_left = vk_left
cont_right = vk_right
cont_up = vk_up
cont_down = vk_down
cont_jump = ord("Z")
cont_attack = ord("X")
cont_taunt = ord("C")
ini_close()