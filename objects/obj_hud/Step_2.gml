if is_combo && combo_amount > 2
{
	if obj_metronome.note_2
		audio_play_sound(sfx_clap,1,0)
	if combo_amount > 5
		if obj_metronome.note_4
			audio_play_sound(sfx_clap2,1,0)
}
prev_score = score
if instance_exists(obj_player)
	old_hp = obj_player.hp