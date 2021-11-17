if state = 1
	draw_sprite_ext(sprite_index,image_index,640,360 + (sin(_time / 10) * 3),2,2,0,c_white,1)
draw_text(100,100,string(state))