extends "res:///Scripts/EnemyScript/Enemy.gd"

func _init():
	bullet = load("res://Objects/Bullet1.tscn")
	
func spawn_bullets():
	var b1 = bullet.instance()
	b1.position = self.position
	b1.rotation = self.rotation
	b1.direction = Vector2(1,0)
	
	var b2 = bullet.instance()
	b2.position = self.position
	b2.rotation = self.rotation
	b2.direction = Vector2(0,1)
	
	var b3 = bullet.instance()
	b3.position = self.position
	b3.rotation = self.rotation
	b3.direction = Vector2(0,-1)
	
	var b4 = bullet.instance()
	b4.position = self.position
	b4.rotation = self.rotation
	b4.direction = Vector2(-1,0)
	
	get_parent().add_child(b1)
	get_parent().add_child(b2)
	get_parent().add_child(b3)
	get_parent().add_child(b4)

