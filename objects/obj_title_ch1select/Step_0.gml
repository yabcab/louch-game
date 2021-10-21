image_index = selected
if keyboard_check_pressed(cont_down) && selected
{
	selected = 0
	obj_title_ch2select.selected = 1
	keyboard_clear(cont_down)
}
if keyboard_check_pressed(cont_up) && selected
{
	selected = 0
	obj_title_ch3select.selected = 1
	keyboard_clear(cont_up)
}
if keyboard_check_pressed(cont_jump) && selected
	room_goto(rm_testroom)
