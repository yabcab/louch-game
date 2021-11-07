if keyboard_check_pressed(ord("X")) || gamepad_button_check_pressed(0,gp_face2)
	game_end()
if keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0,gp_face1)
	room_goto(room_togo)

if gamepad_is_connected(0)
	text = "--DISCLAIMER--\n\n1. This is NOT a finished product in any way shape or form. Anything can\nchange at a moment's notice.\n2. This is a private build, please do NOT redistribute this build\noutside the playtest group.\n\nPress [A] to acknowledge and continue\nPress [B] to exit the game"
else
	text = "--DISCLAIMER--\n\n1. This is NOT a finished product in any way shape or form. Anything can\nchange at a moment's notice.\n2. This is a private build, please do NOT redistribute this build\noutside the playtest group.\n\nPress [Z] to acknowledge and continue\nPress [X] to exit the game"