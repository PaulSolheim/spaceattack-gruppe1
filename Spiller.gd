extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var speed = 500

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("left"):
		position.x -= speed * delta
	elif Input.is_action_pressed("right"):
		position.x += speed * delta
		
