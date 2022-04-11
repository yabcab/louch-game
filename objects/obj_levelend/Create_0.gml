alarm[0] = 60

bg_alpha = 0
bring_title = 0
titleoff = 50
title_alpha = 0

bring_score = 0
score_display = 0
score_startcounting = 0
score_off = 50
score_alpha = 0

bring_crown = 0
crown_off = 50
crown_alpha = 0
crown_display = 0
crown_startcounting = 0
crown_set = 0

bring_combo = 0
combo_display = 0
combo_off = 50
combo_alpha = 0
combo_set = 0
combo_startcounting = 0

exit_set = 0
exit_ = 0

final_off = 50
final_alpha = 0
final_showscore = 0
final_display = 0
final_score = floor((((score / rank_point_req) * 100) * 0.5) + (((crowncollects / crowncollecttotal) * 100) * 0.25) + (((rank_highestcombo / rank_highestcombo_req) * 100) * 0.25))

ini_open("savedata.lmao")
if ini_read_real("level_scoredata",string(level) + "_percent",0) < final_score
{
	ini_write_real("level_scoredata",string(level) + "_percent",final_score)
	ini_write_real("level_scoredata",string(level) + "_points",score)
	ini_write_real("level_scoredata",string(level) + "_combo",rank_highestcombo)
	ini_write_real("level_scoredata",string(level) + "_crown",crowncollects)
}
if nodamage
	ini_write_real("level_scoredata",string(level) + "_nodamage",nodamage)
ini_write_real("level_completion",string(level),1)

extras_off = 50
extras_alpha = 0

with obj_player
{
	xs = 1
	ys = 1
}
