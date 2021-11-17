if room = startroom
{
	scale += 0.05
	image_angle += 5
}
else
{
	scale -= 0.1
	image_angle += 10
	if scale < 0
		instance_destroy()
}