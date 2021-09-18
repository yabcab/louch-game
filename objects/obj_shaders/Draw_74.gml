if drunk 
{
	shader_set(shader_Heat);
	shader_set_uniform_f(wave_time, current_time);
	draw_surface(application_surface, 0,0 );
	shader_reset();
}