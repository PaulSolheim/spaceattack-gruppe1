extends KinematicBody2D

export(PackedScene) var projectile

onready var timer = $Timer

var speed = 500
var screen_size
var can_shoot = true

func _ready():
	screen_size = get_viewport_rect().size.x
	pass

func _process(delta):
	position.x = clamp(position.x, 0, screen_size)
	if Input.is_action_pressed("left"):
		position.x -= speed * delta
	elif Input.is_action_pressed("right"):
		position.x += speed * delta
	if  can_shoot and Input.is_action_pressed("shoot"):
		can_shoot = false
		var new_projectile = projectile.instance()
		get_parent().add_child(new_projectile)
		new_projectile.position = position
		timer.start()


func _on_Timer_timeout():
	can_shoot = true
	
