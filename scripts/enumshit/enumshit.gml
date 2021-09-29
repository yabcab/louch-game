// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enumshit(){
	enum playerstate {
		none = -1,
		idle,
		old_portal,
		ground_pound,
		boost,
		hurt,
		taunt,
		sad,
		happy,
		balloon_normal,
		balloon_dash,
		water_jump,
		dying,
		high,
		level_end,
	}

enum pausestate {
	none,
	playerpause,
	nonplayerpause
}

enum level_id {
	none = 0,
	grass,
	jungle,
	space,
}

}