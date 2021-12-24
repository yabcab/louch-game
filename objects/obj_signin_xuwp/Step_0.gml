switch state
{
	case 0:
	{
		showinfo = 0
		if gamepad_button_check_pressed(0,gp_face1)
		{
			xboxlive_show_account_picker()
			controllerbind = 0
			state = 1
		}
		if gamepad_button_check_pressed(1,gp_face1)
		{
			xboxlive_show_account_picker()
			controllerbind = 1
			state = 1
		}
		if gamepad_button_check_pressed(2,gp_face1)
		{
			xboxlive_show_account_picker()
			controllerbind = 2
			state = 1
		}
		if gamepad_button_check_pressed(3,gp_face1)
		{
			xboxlive_show_account_picker()
			controllerbind = 3
			state = 1
		}
		if gamepad_button_check_pressed(4,gp_face1)
		{
			xboxlive_show_account_picker()
			controllerbind = 4
			state = 1
		}
		if gamepad_button_check_pressed(5,gp_face1)
		{
			xboxlive_show_account_picker()
			controllerbind = 5
			state = 1
		}
	}
	break;
	
	case 1:
	{
		if obj_xboxlive.user = -8
			state = 0
		else
		if obj_xboxlive.user != -9
			state = 2
	}
	break;
	
	case 2:
	{
		showinfo = 1
		if gamepad_button_check_pressed(controllerbind,gp_face1)
			room_goto(rm_init)
	}
}