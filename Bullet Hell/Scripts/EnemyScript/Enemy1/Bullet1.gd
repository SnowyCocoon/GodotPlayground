extends "res:///Scripts/EnemyScript/Bullet.gd"

func _process(delta):
	self.position += direction.rotated(rotation) * delta * bullet_speed
	if($RayCast2D.is_colliding()):
		print("Hit!")
		queue_free()
