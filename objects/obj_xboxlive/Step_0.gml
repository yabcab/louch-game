if os_type = os_uwp
{
	var _type = async_load[? "event_type"];
	switch(_type)
	{
	case "user signed in": 
	    tag = xboxlive_gamertag_for_user();
	    break;
		
	case "user sign in failed":
		user = -8
		
		break;
		
	case "user_signed_out":
	    room_goto(rm_signin)
		user = -9
		
	    break;
	}
	
	if grabinfos
	{
		pfp_l = xboxlive_gamerpic_large
		pfp_m = xboxlive_gamerpic_medium
		pfp_s = xboxlive_gamerpic_small
	}
}