extends Node2D

var direction = Vector2(0,1)
export var bullet_speed = 100

func _ready():
	pass # Replace with function body.

func _process(delta):
	self.position -= direction * delta * bullet_speed
	_bullet_Colliding()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _bullet_Colliding():
	if($RayCast2D.is_colliding()):
		var target = $RayCast2D.get_collider()
		if target.is_in_group("Enemy"):
			print("Enemy Hit!")
			queue_free()
			
			if target.get_parent().health > 0:
				target.get_parent().health -= 1
			
