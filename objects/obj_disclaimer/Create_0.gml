seconds = 30
minutes = 2
col_1 = make_color_rgb(255,255,255)
col_2 = make_color_rgb(136,234,255)
col_3 = make_color_rgb(28,52,197)
draw_set_font(fnt_text)
if gamepad_is_connected(0)
	text = "--DISCLAIMER--\n\n1. This is NOT a finished product in any way shape or form. Anything can\nchange at a moment's notice.\n2. This is a private build, please do NOT redistribute this build\noutside the playtest group.\n\nPress [Z] to acknowledge and continue\nPress [X] to exit the game"
else
	text = "--DISCLAIMER--\n\n1. This is NOT a finished product in any way shape or form. Anything can\nchange at a moment's notice.\n2. This is a private build, please do NOT redistribute this build\noutside the playtest group.\n\nPress [A] to acknowledge and continue\nPress [B] to exit the game"
room_togo = rm_init
alarm[0] = 10