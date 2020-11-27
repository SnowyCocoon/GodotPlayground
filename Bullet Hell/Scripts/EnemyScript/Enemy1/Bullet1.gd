extends "res:///Scripts/EnemyScript/Bullet.gd"

func _process(delta):
	self.position += direction.rotated(rotation) * delta * bullet_speed
	_bullet_Colliding()
