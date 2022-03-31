var i, int
int = (image_xscale * image_yscale * fog_intensity) / 5

for (i = 0; i < int; i++)
{
	//instance_create_depth(random_range(x,x + (image_xscale * 32)),random_range(y,y + (image_yscale * 32)),-5,obj_fog)
	part_particles_create(particle_system,random_range(x,x + (image_xscale * 32)),random_range(y,y + (image_yscale * 32)),fog_part,1)
}