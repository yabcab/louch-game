play = false;
bpm = 135;
beat_ms = 60000000/(bpm*3);

note_dtime = 0;   //delta time per note
s_note_dtime = 0;
t_note_dtime = 0;
note_count = 0;
pnote_count = 0
note_prev = 15;   //previous note count

//these will be our musical triggers!
note_1 = false;
note_2 = false;
note_4 = false;
note_8 = false;
note_16 = false;

previous_ms = 0