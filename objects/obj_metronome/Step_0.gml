note_dtime += delta_time * audio_sound_get_pitch(obj_music.mu) //add deltatime passed between steps
s_note_dtime += delta_time * audio_sound_get_pitch(mu_secret) //add deltatime passed between steps
t_note_dtime += delta_time * audio_sound_get_pitch(mu_timetrial) //add deltatime passed between steps

if is_trial
{
	note_count = round(t_note_dtime div beat_ms) mod 16  //count notes
	pnote_count = round(t_note_dtime div previous_ms) mod 16
}
else
	if is_secret
	{
		note_count = round(s_note_dtime div beat_ms) mod 16  //count notes
		pnote_count = round(s_note_dtime div previous_ms) mod 16
	}
	else
	{
		note_count = round(note_dtime div beat_ms) mod 16  //count notes
		pnote_count = round(note_dtime div previous_ms) mod 16
	}

//trigger the 16th notes
if (note_count != note_prev) {
  switch (note_count) {
    case 0:
      note_1 = true
      note_2 = true;
      note_4 = true;
      note_8 = true;
      note_16 = true;
    break;
    case 1:
    case 3:
    case 5:
    case 7:
    case 9:
    case 11:
    case 13:
    case 15:
      note_16 = true;
    break;
    case 2:
    case 6:
    case 10:
    case 14:
      note_8 = true;
      note_16 = true;
    break;
    case 4:
    case 12:
      note_4 = true;
      note_8 = true;
      note_16 = true;
    break;
    case 8:
      note_2 = true;
      note_4 = true;
      note_8 = true;
      note_16 = true;
    break;
    }
	if previous_ms >= beat_ms
		note_prev = note_count;
}

//debug
if note_4
{
	image_xscale = 2
	image_yscale = 2
}
image_xscale = lerp(image_xscale,1,0.05)
image_yscale = lerp(image_yscale,1,0.05)