draw_sprite_ext(spr_timewall_border,0,x,y,image_xscale * 32,image_yscale * 32,0,c_white,image_alpha - 0.6)
draw_sprite_ext(spr_timewall_border,0,x,y,image_xscale * 32,1,0,c_white,image_alpha)
draw_sprite_ext(spr_timewall_border,0,x,y,1,image_yscale * 32,0,c_white,image_alpha)
draw_sprite_ext(spr_timewall_border,0,x,y + (image_yscale * 32) - 1,image_xscale * 32,1,0,c_white,image_alpha)
draw_sprite_ext(spr_timewall_border,0,x + (image_xscale * 32) - 1,y,1,image_yscale * 32,0,c_white,image_alpha)
var xx = 0
var yy = 0
for (xx = 0; xx < image_xscale; xx++)
{
	for (yy = 0; yy < image_yscale; yy++)
	{
		random_set_seed(xx * yy * x * y)
		draw_sprite_ext(choose(spr_stars1,spr_stars2,spr_stars3),image_index,x + (xx * 32),y + (yy * 32),1,1,0,c_white,image_alpha)
	}
}
randomize()