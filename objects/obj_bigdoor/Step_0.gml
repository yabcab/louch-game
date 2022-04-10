if instance_place(x,y,obj_player)
{
	score_off = lerp(score_off,0,0.075)
	score_alpha = lerp(score_alpha,1,0.075)
}
else
{
	score_off = lerp(score_off,20,0.075)
	score_alpha = lerp(score_alpha,0,0.075)
}
