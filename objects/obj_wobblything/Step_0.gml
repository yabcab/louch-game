_time++
variation_x = sin(_time * vari_spd) * vari_intensity
variation_y = sin(_time * vari_spd) * vari_intensity

if vari_intensity > 0
	vari_intensity -= vari_intchange_spd
else
{
	vari_intensity = 0
	_time = 25
}