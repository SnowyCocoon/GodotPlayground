extends Node2D

var direction = Vector2(1,0)
export var bullet_speed = 100

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
