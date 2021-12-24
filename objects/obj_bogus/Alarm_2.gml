/// @description init new attack

switch hp {
	case 4:
	{
		hitable = 0
		alarm[0] = 250
		diff = 2
	}
	break;
	
	case 3:
	{
		attackstate = nolanattacks.bogusgun
		state = nolanstate.flyaround
		
	}
	break;
	
	case 2:
	{
		
	}
	break;
	
	case 1:
	{
		
	}
	break;
	
	case 0:
	{
		
	}
	break;
}