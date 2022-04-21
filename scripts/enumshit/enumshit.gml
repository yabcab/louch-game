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
		lava_hurt,
		cart,
		swim,
		balloon_pound,
		keyfly,
		antigrav,
		level_enter,
		noclip,
		pipe,
		sliding,
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
	snow,
	beach,
	sky1,
	tutorial,
	gaunt_grass,
	gaunt_jungle,
	gaunt_space,
	gaunt_ice,
	gaunt_beach,
}

enum palette {
	normal,
	diablo,
	smurf,
	silver,
	gold,
	gb,
	void,
	sketch,
	glass,
	bluehairandpronouns,
	aidan,
	outline,
	whathaveyoudone,
	lowdetail,
	classic,
	realistic,
}

}