if speed > 0
	speed -= 0.1
else
	speed = 0

wait += 1
if wait > 5
	image_alpha -= 0.03

if image_alpha < 0
	instance_destroy()
	
image_angle += speed * 1.5