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
	audio_sound_pitch(secretmusic,audio_pitchchange + pitch_offset)
	audio_sound_pitch(trialmusic,audio_pitchchange + escapeoffset + pitch_offset)
	audio_sound_pitch(trialmusicsecret,audio_pitchchange + escapeoffset + pitch_offset)
}
else
{
	audio_sound_pitch(mu,1 + pitch_offset)
	audio_sound_pitch(secretmusic,1 + pitch_offset)
	audio_sound_pitch(trialmusic,1 + escapeoffset + pitch_offset)
	audio_sound_pitch(trialmusicsecret,1 + escapeoffset + pitch_offset)
}
if !audio_is_playing(mu)
{
	audio_stop_sound(playing_mu)
	playing_mu = audio_play_sound(mu,1,0)
	obj_metronome.note_dtime = 0
}
if !audio_is_playing(secretmusic)
{
	audio_stop_sound(playing_secretmusic)
	playing_secretmusic = audio_play_sound(secretmusic,1,0)
	obj_metronome.s_note_dtime = 0
}
if !audio_is_playing(pausemusic)
	pausemusic = audio_play_sound(mu_pause,1,0)

if pause_state != pausestate.playerpause
{
	if instance_exists(obj_freezetimer)
		pitch_offset = lerp(pitch_offset,-0.2,0.075)
	else
		pitch_offset = lerp(pitch_offset,0,0.075)
	audio_sound_gain(pausemusic,0,0)
	if is_trial
	{
		if !audio_is_playing(trialmusic)
		{
			audio_stop_sound(playing_trialmusic)
			audio_stop_sound(playing_trialmusicsecret)
			playing_trialmusic = audio_play_sound(trialmusic,1,0)
			if trialmusic != trialmusicsecret
				playing_trialmusicsecret = audio_play_sound(trialmusicsecret,1,0)
			obj_metronome.t_note_dtime = 0
		}
		if trialmusic = trialmusicsecret
		{
			audio_sound_gain(trialmusic,mu_vol,0)
			metronome_set(bpm_map[trialmusic],trialmusic)
		}
		else
		{
			if is_secret
			{
				audio_sound_gain(trialmusic,0,0)
				audio_sound_gain(trialmusicsecret,mu_vol,0)
				metronome_set(bpm_map[trialmusic],trialmusic)
			}
			else
			{
				audio_sound_gain(trialmusic,mu_vol,0)
				audio_sound_gain(trialmusicsecret,0,0)
				metronome_set(bpm_map[trialmusicsecret],trialmusicsecret)
			}
		}
		audio_sound_gain(mu,0,0)
		audio_sound_gain(secretmusic,0,0)
	}
	else
	if is_secret
	{
		audio_sound_gain(mu,0,0)
		audio_sound_gain(secretmusic,mu_vol,0)
		audio_sound_gain(playing_trialmusicsecret,0,0)
		audio_sound_gain(playing_trialmusic,0,0)
		metronome_set(bpm_map[secretmusic],secretmusic)
	}
	else
	{
		if mu != trialmusic
			audio_stop_sound(trialmusic)
		audio_sound_gain(secretmusic,0,0)
		audio_sound_gain(trialmusic,0,0)
		audio_sound_gain(trialmusicsecret,0,0)
		audio_sound_gain(mu,mu_vol,0)
		audio_sound_gain(mu_pause,mu_vol,0)
		metronome_set(bpm_map[mu],mu)
	}
}
else if !instance_exists(obj_hitstun) && !instance_exists(obj_circletransition)
{
	pitch_offset = lerp(pitch_offset,-1 - escapeoffset - audio_pitchchange,0.05)
	if pitch_offset <= 0
		audio_sound_gain(pausemusic,mu_vol,60)
}
