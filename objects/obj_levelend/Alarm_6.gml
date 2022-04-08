final_showscore = 1
if final_score > 100 || nodamage
	audio_play_sound(sfx_crowncollect,1,0)

audio_stop_sound(sfx_levelenddrumroll)
audio_play_sound(sfx_levelenddrumhit,1,0)
