//temporary testing randoms
assigned_x = random_range(0,sprite_get_width(sprite_index) - 1)
assigned_y = random_range(0,sprite_get_height(sprite_index) - 1)
assigned_w = random_range(0,sprite_get_width(sprite_index) - 1 - assigned_x)
assigned_h = random_range(0,sprite_get_height(sprite_index) - 1 - assigned_y)

slantintensity  = random_range(0.1,1)
xscaleintensity = random_range(0.1,1)
yscaleintensity = random_range(0.1,1)

spd  = random_range(0.05,0.4)

_time = 0
slant = 0
slantdir = choose(-1,1)

hspeed = random_range(-3,3)