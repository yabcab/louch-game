if opened 
{
	draw_set_alpha(0.4)
	draw_rectangle_color(0,0,5000,5000,c_blue,c_blue,c_blue,c_blue,false)
	draw_set_alpha(1)
	
	var title, desc, shd
	
	shd = shader_current()
	pal_swap_set(spr_playerpalette,obj_player.paletteselect,0)
	draw_sprite_ext(spr_playerLS_still,image_index,650 + offset,400 + offset2,2,2,0,c_white,1)
	shader_set(shd)
	
	switch obj_player.paletteselect { 
		default: { title = "no"; desc = "no" } break;
		case palette.normal: { title = "Louch [Default]"; desc = "Just your typical run of the mill Louch." } break;
		case palette.diablo: { title = "Diablo Sauce"; desc = "Hey, remember BogusGame? Yeah this person was in it." } break;
		case palette.smurf: { title = "Oxygen Starved"; desc = "Please breathe I will be sad if you die :(" } break;
		case palette.silver: { title = "Silver Louch"; desc = "Louch but 10x more valuble." } break;
		case palette.gold: { title = "Gold Louch"; desc = "Louch but 100x more valuble." } break;
		case palette.gb: { title = "Videogame Child"; desc = "Hey guys I just bought the new \"Videogame Child\" it's so cool guys!!" } break;
		case palette.void: { title = "The Void"; desc = "Stare into it... Is there something there or is it just an empty hole devoid of even light itself?" } break;
		case palette.sketch: {  title = "Sketch"; desc = "Someone get the crayons and color 'em in!" } break;
		case palette.glass: { title = "Glass-like"; desc = "''I get ignored so much it's almost as if im see-through!!''" } break;
		case palette.bluehairandpronouns: { title = "Bright Bluez"; desc = "Lucain said this color scheme looked nice so it's a palette now!" } break;
		case palette.aidan: { title = "AIDANG"; desc = "HOLY OH MY GOD IT IS AIDANG FROM ODYSSEY OF THE MIND GUYS :O" } break;
		case palette.outline: { title = "Outline"; desc = "You shall not see well, you shall need prescription glasses." } break;
		case palette.whathaveyoudone: { title = "stop"; desc = "what have you done" } break;
		case palette.lowdetail: { title = "Low Graphics Settings"; desc = "Shadows: [OFF]" } break;
		case palette.classic: { title = "Classic"; desc = "Louch HATES this style! Learn how I don't care!" } break;
	}
	
	draw_text_outlined(650 - string_width(title),460,c_white,c_black,title,2,2)
	draw_text_outlined(650 - (string_width(desc) / 1.4),520,c_white,c_black,desc,1.5,1.5)
	
	
}