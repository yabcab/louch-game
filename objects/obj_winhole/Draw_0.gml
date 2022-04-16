var i;
for (i = 0; i < 256 * image_xscale; i++)
{
	draw_sprite_part(spr_checkers,0,i - ((floor(i / 32)) * 32),0,1,64 * image_yscale,x + i - (128 * (image_xscale)),y + sin((_time + i) / 20) * 3)
}
