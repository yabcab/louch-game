fx = fx_create("_filter_colourise")
fx_set_parameter(fx,"g_Intensity",0.5)
fx_set_parameter(fx,"g_TintCol",[153,192,255,255])
lay = layer_create(-100,"timestop_fx")
layer_set_fx(lay,fx)