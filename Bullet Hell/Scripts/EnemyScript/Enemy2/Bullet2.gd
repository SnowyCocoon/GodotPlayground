extends "res:///Scripts/EnemyScript/Bullet.gd"

func _init():
	bullet_speed = 400

func _process(delta):
	self.position += direction * delta * bullet_speed
	if($RayCast2D.is_colliding()):
		print("Hit!")
		queue_free()
