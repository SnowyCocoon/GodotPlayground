extends Node2D

var direction = Vector2(1,0)
export var bullet_speed = 100

func _ready():
	pass # Replace with function body.


func _process(delta):
	self.position += direction.rotated(rotation) * delta * bullet_speed
	if($RayCast2D.is_colliding()):
		print("Hit!")
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
