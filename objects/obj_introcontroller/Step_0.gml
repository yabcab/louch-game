if start1
{
	image_alpha = 1
	afterimg_scale += 0.025
	afterimg_alpha -= 0.07
}
if start2
{
	alphascroll += 0.05
	if abs(scroll - targetscroll) > 1
	scroll += (targetscroll - scroll) / 20
	else
		scroll = targetscroll
}