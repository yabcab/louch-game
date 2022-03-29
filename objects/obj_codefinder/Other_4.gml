if colview
{
	layer_set_visible(layer_get_id("Tiles_1"),0)
	layer_set_visible(layer_get_id("Tiles_2"),0)
}
if void
{
	//if layer_exists("Background")
	//	layer_destroy(layer_get_id("Background"))
	while instance_exists(obj_parallax)
		instance_destroy(obj_parallax)
	while instance_exists(obj_parallax_nontiled)
		instance_destroy(obj_parallax_nontiled)
	while instance_exists(obj_parallax_title)
		instance_destroy(obj_parallax_title)
	keyboard_string = ""
}
