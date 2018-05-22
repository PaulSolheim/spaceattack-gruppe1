extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var speed = 500
export var damage = 10

func _ready():
	connect("area_entered", self, "on_area_entered")
	
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	position.y -= speed * delta
	if position.y < -2000:
		queue_free()
		
func on_area_entered(area):
	if area.is_in_group("enemies"):
		area.add_damage(damage)
		queue_free()
