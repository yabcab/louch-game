ini_open("savedata.lmao")
if ini_read_real("crowncollects_" + string(level),cid,0)
{
	image_alpha = 0.5
	precollect = 1	
}
ini_close()
