if alphawait > 25
	image_alpha -= 0.025
image_xscale += 0.005
image_yscale += 0.005
if image_alpha < 0
	instance_destroy()
alphawait += 1