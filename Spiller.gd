extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export(PackedScene) var projectile
var speed = 500
var screen_size

func _ready():
	screen_size = get_viewport_rect().size.x
	pass

func _process(delta):
	position.x = clamp(position.x, 0, screen_size)
	if Input.is_action_pressed("left"):
		position.x -= speed * delta
	elif Input.is_action_pressed("right"):
		position.x += speed * delta
	if Input.is_action_pressed("shoot"):
		var new_projectile = projectile.instance()
		add_child(new_projectile)
