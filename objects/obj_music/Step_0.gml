var escapeoffset = 0
if instance_exists(obj_timer)
	if obj_timer.minutes < 1 && obj_timer.seconds < 51
	{
		escapeoffset = 0.15
		if obj_timer.seconds < 26
		{
			escapeoffset = 0.3
			if obj_timer.seconds < 6
				escapeoffset = 0.5
		}
	}

if obj_shaders.drunk
{
	audio_pitchchange_time += 0.015
	audio_pitchchange = (sin(audio_pitchchange_time) / 3) + 1
	audio_sound_pitch(mu,audio_pitchchange + pitch_offset)
	audio_sound_pitch(mu_secret,audio_pitchchange + pitch_offset)
	audio_sound_pitch(mu_timetrial,audio_pitchchange + escapeoffset + pitch_offset)
	audio_sound_pitch(mu_escapesecret,audio_pitchchange + escapeoffset + pitch_offset)
}
else
{
	audio_sound_pitch(mu,1 + pitch_offset)
	audio_sound_pitch(mu_secret,1 + pitch_offset)
	audio_sound_pitch(mu_timetrial,1 + escapeoffset + pitch_offset)
	audio_sound_pitch(mu_escapesecret,1 + escapeoffset + pitch_offset)
}
if !audio_is_playing(mu)
{
	audio_stop_all()
	audio_play_sound(mu,1,1)
}
if !audio_is_playing(mu_secret)
	audio_play_sound(mu_secret,1,1)

if is_trial
{
	if !audio_is_playing(mu_timetrial) && !audio_is_playing(mu_escapesecret)
	{
		audio_play_sound(mu_escapesecret,1,0)
		audio_play_sound(mu_timetrial,1,0)
	}
	audio_sound_gain(mu,0,0)
	audio_sound_gain(mu_secret,0,0)
	if is_secret
	{
		audio_sound_gain(mu_timetrial,0,0)
		audio_sound_gain(mu_escapesecret,0.2,0)
	}
	else
	{
		audio_sound_gain(mu_timetrial,1,0)
		audio_sound_gain(mu_escapesecret,0,0)
	}
}
else
if is_secret
{
	audio_sound_gain(mu,0,0)
	audio_sound_gain(mu_secret,0.4,0)
	audio_sound_gain(mu_timetrial,0,0)
}
else
{
	audio_stop_sound(mu_timetrial)
	audio_sound_gain(mu,0.2,0)
	audio_sound_gain(mu_secret,0,0)
	audio_sound_gain(mu_timetrial,0,0)
}