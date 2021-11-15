_time++

if instance_exists(obj_player)
{
	hp = obj_player.hp
	if combotimer > 0
	{
		is_combo = 1
		combo_amount = clamp(obj_player.combo,0,10)
		comboletter_rise_target = 75
		if pause_state != pausestate.playerpause
			combotimer--
	}
	else
	{
		is_combo = 0
		comboletter_rise_target = -50
		if comboletter_rise[5] < -45
			combo_amount = 0
		obj_player.combo = 0
	}
}
else
{
	hp = 0
	is_combo = 0
	if comboletter_rise_target < -45
		combo_amount = 0
	comboletter_rise_target = -50
}

if abs(comboletter_rise[0] - comboletter_rise_target) > 1
	comboletter_rise[0] += (comboletter_rise_target - comboletter_rise[0]) / 5
else
	comboletter_rise[0] = comboletter_rise_target

if abs(comboletter_rise[0] - comboletter_rise_target) < 75
{
	if abs(comboletter_rise[1] - comboletter_rise_target) > 1
		comboletter_rise[1] += (comboletter_rise_target - comboletter_rise[1]) / 5
	else
		comboletter_rise[1] = comboletter_rise_target
	
	if abs(comboletter_rise[1] - comboletter_rise_target) < 75
	{
		if abs(comboletter_rise[2] - comboletter_rise_target) > 1
			comboletter_rise[2] += (comboletter_rise_target - comboletter_rise[2]) / 5
		else
			comboletter_rise[2] = comboletter_rise_target
		
		if abs(comboletter_rise[2] - comboletter_rise_target) < 75
		{
			if abs(comboletter_rise[3] - comboletter_rise_target) > 1
				comboletter_rise[3] += (comboletter_rise_target - comboletter_rise[3]) / 5
			else
				comboletter_rise[3] = comboletter_rise_target
			
			if abs(comboletter_rise[3] - comboletter_rise_target) < 75
			{
				if abs(comboletter_rise[4] - comboletter_rise_target) > 1
					comboletter_rise[4] += (comboletter_rise_target - comboletter_rise[4]) / 5
				else
					comboletter_rise[4] = comboletter_rise_target
				
				if abs(comboletter_rise[4] - comboletter_rise_target) < 75
				{
					if abs(comboletter_rise[5] - comboletter_rise_target) > 1
						comboletter_rise[5] += (comboletter_rise_target - comboletter_rise[5]) / 5
					else
						comboletter_rise[5] = comboletter_rise_target
				}
			}
		}
	}
}