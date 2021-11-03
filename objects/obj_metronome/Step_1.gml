note_1 = false;
note_2 = false;
note_4 = false;
note_8 = false;
note_16 = false;
if (play) {
     note_count = 0;
     note_dtime = 0;
     note_prev = 15;
     play = !play;
     beat_ms = 60000000/(bpm*4)
     exit;
}
previous_ms = beat_ms