direction += 2.5
_time++
ysin = sin(_time / 20) * 5

var xx = x
x = xstart
if distance_to_object(obj_player) < 100
{
	image_alpha = lerp(image_alpha,0.8,0.075)
	if has_dialogue
		str_length += 0.25
}
else
{
	image_alpha = lerp(image_alpha,0,0.075)
	if has_dialogue
		str_length -= 1
}
str_length = clamp(str_length,0,string_length(str))
x = xx
