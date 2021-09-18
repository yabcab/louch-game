wait += 1
if wait > 150
{
	downoff += 1
	if downoff > 200
		instance_destroy()
}