image_index = selected
if keyboard_check_pressed(vk_down) && selected
{
	selected = 0
	obj_title_ch1select.selected = 1
	keyboard_clear(vk_down)
}
if keyboard_check_pressed(vk_up) && selected
{
	selected = 0
	obj_title_ch2select.selected = 1
	keyboard_clear(vk_up)
}
if keyboard_check_pressed(ord("Z")) && selected
	room_goto(rm_testroom)
