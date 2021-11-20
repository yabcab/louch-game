if pause_state != pausestate.playerpause
{
	if startfade
	{
		image_alpha -= 0.05
		alph -= 0.05
	}
	if image_alpha < -1
		instance_destroy()

	if flash
	{
		flashtime++
		if flashtime > 2
		{
			flashtime = 0
			if image_alpha = alph
			{
				alph = image_alpha
				image_alpha = 0
			}
			else
				image_alpha = alph
		}
	}
}