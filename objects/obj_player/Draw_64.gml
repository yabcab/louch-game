

draw_text(10,10,"keys: " + string(keys))
draw_text(10,25,"roomname: " + room_get_name(room))
draw_text(10,40,"deaths: " + string(deaths))
draw_text(10,55,"hp: " + string(hp))

draw_sprite_ext(spr_fade,0,0,0,1000,1000,0,c_black,fade_amount)