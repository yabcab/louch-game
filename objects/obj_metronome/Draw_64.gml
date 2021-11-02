draw_text(50,50,string(note_1))
draw_text(50,65,string(note_2))
draw_text(50,80,string(note_4))
draw_text(50,95,string(note_8))
draw_text(50,110,string(note_16))

draw_text(50,130,string(beat_ms))
draw_text(50,145,string(audio_sound_get_pitch(obj_music.playing_mu)))

draw_sprite_ext(spr_apple,0,100,50,image_xscale,image_yscale,0,c_white,1)