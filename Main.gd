extends Node


# Declare member variables here. Examples:
var x
var y
var count = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	var initial_x = $BodyBall.position.x 
	var initial_y = $BodyBall.position.y
	$Sliders/HSliderAngle.value = Global.angle
	$Sliders/HSliderForce.value = Global.force
	$Score.text = "Score: " + str(Global.score)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	x = $BodyBall.position.x 
	y = $BodyBall.position.y
	
	if (y > 420):
		count += 1
		
	if count == 50:
		get_tree().reload_current_scene()
	
	if y < 0:
		get_tree().reload_current_scene()
		
	if (x > 790) && (x < 850) && (y > 217) && (y < 260):
		if (!$AudioApplause.playing):
			$AudioApplause.play()
			Global.score += 1
			$Score.text = "Score: " + str(Global.score)

func _on_ButtonShoot_pressed():
	
	var offset
	var impulse
	
	#get the angle and the vector
	Global.angle = $Sliders/HSliderAngle.value
	Global.force = $Sliders/HSliderForce.value
	
	#calculate the impulse
	offset = Vector2(0,0) #Hit the ball at the center
	impulse = get_impulse_vector(Global.angle, Global.force)
	
	$BodyBall.apply_impulse(offset,impulse)
	
func _on_ButtonQuit_pressed():
	get_tree().quit()

func get_impulse_vector(angle, size):
	#convert the angle to radians.
	angle = angle * PI / 180
	#get x and y conents of the impulse vector.
	var fx = size * cos(angle)
	var fy = - size * sin(angle)
	#output the result
	var out = Vector2(fx, fy)
	
	return out
			
			


	
	
	
	






	

