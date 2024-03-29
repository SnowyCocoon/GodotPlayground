extends Node2D

var direction = Vector2(1,0)
export var bullet_speed = 100

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _bullet_Colliding():
	if($RayCast2D.is_colliding()):
		var target = $RayCast2D.get_collider()
		if target.is_in_group("Player"):
			print("Hit!")
			queue_free()
			
			if target.get_parent().health > 0:
				target.get_parent().health -= 1
				target.get_parent().advance_status()
