extends Node


# Declare member variables here. Examples:
var x
var y
var count = 0

var offset = Vector2(0,0) #Hit the ball at the center
var impulse = Vector2(100,-100) # impulse with wich we push the ball

# Called when the node enters the scene tree for the first time.
func _ready():
	var initial_x = $BodyBall.position.x 
	var initial_y = $BodyBall.position.y


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


func _on_ButtonShoot_pressed():
	$BodyBall.apply_impulse(offset,impulse)
	
