seconds = 15
minutes = 0
alarm[0] = 60
x = 640
y = 32
col_1 = make_color_rgb(255,255,255)
col_2 = make_color_rgb(136,234,255)
col_3 = make_color_rgb(28,52,197)
obj_music.pitch_offset += -0.2
fx = fx_create("_filter_colourise")
fx_set_parameter(fx,"g_Intensity",0.5)
fx_set_parameter(fx,"g_TintCol",[153,192,255,255])
lay = layer_create(-100,"timestop_fx")
layer_set_fx(lay,fx)
instance_create_depth(x,y,1,obj_whiteout)