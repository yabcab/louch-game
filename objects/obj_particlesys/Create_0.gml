globalvar particle_system; particle_system = part_system_create_layer(layer,true)

//fog particles
globalvar fog_part; fog_part = part_type_create()
part_type_shape(fog_part,pt_shape_cloud)
part_type_scale(fog_part,1,1)
part_type_color2(fog_part,c_white,c_ltgrey)
part_type_alpha2(fog_part,0.2,0)
part_type_speed(fog_part,0.025,0.2,0.0075,0)
part_type_direction(fog_part,0,359,0,0)
part_type_orientation(fog_part,0,359,2,0,0)
part_type_blend(fog_part,0)
part_type_life(fog_part,100,200)