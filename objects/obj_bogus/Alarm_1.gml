/// @description init attackable phase

switch hp {
	case 5:
	{
		attackstate = nolanstate.none
		state = nolanstate.runaround
		hitable = 1
	}
	break;
}