if drunk && !performance_mode
{
	display_set_gui_size(dwidth,dheight)
	shader_set(shader_Heat);
	shader_set_uniform_f(wave_time, current_time);
	draw_surface(application_surface, 0,0 );
	shader_reset();
	display_set_gui_size(1280,720)
}