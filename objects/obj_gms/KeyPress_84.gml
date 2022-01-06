if !gms_chat_istyping()
	if chatopen
	{
		chatopen = 0
		gms_draw_toggle(0)
	}
	else
	{
		chatopen = 1
		gms_draw_toggle(1)
	}