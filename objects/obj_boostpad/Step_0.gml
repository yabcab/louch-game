if !trialdependant || (trialdependant && is_timetrial)
	visible = 1
else
	visible = 0

if trialdependant && !p_trialdependant
{
	p_trialdependant = 0
		// ADD LATER
}