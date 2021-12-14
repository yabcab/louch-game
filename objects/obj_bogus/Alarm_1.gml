/// @description init attackable phase

switch hp {
	case 5:
	{
		attackstate = nolanstate.none
		state = nolanstate.runaround
		hitable = 1
	}
	break;
	
	case 4:
	{
		attackstate = nolanattacks.bogusbox
		state = nolanstate.runaround
		hitable = 1
		diff = 1
	}
	break;
	
	case 3:
	{
		
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
}