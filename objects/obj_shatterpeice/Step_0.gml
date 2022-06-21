_time++

image_xscale = sin(_time * spd) * xscaleintensity
image_yscale = sin(_time * spd) * yscaleintensity
slant        = sin(_time * spd) * slantintensity

vspeed += 0.2