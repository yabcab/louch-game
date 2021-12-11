//if keyboard_check_pressed(ord("X")) || gamepad_button_check_pressed(0,gp_face2)
//	game_end()
if keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0,gp_face1)
	room_goto(room_togo)

if !gamepad_is_connected(0)
text = @"
--DISCLAIMER--

Hello Again! Pretty much the same disclaimer as last time, blah blah blah don't 
distribute the build outside the playtest group and stuff.

Some major things that happened in the last 2 months:
-Added the HUD
-2 WIP levels
-Actual hub, tutorial, and dance room
-Title screen and settings
-Alot more OST tracks
-Controller support
That's pretty much a rundown of the progress made on the game. Have Fun!

Press [Z] to continue to the game"
else
text = @"
--DISCLAIMER--

Hello Again! Pretty much the same disclaimer as last time, blah blah blah don't 
distribute the build outside the playtest group and stuff.

Some major things that happened in the last 2 months:
-Added the HUD
-2 WIP levels
-Actual hub, tutorial, and dance room
-Title screen and settings
-Alot more OST tracks
-Controller support
That's pretty much a rundown of the progress made on the game. Have Fun!

Press [A] to continue to the game"