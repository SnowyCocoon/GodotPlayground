extends "res:///Scripts/EnemyScript/Enemy.gd"

onready var player = get_parent().get_node("Player")

func _init():
	bullet = load("res://Objects/Bullet2.tscn")

func spawn_bullets():
	var b1 = bullet.instance()
	b1.position = self.position
	b1.direction = Vector2(player.position.x - self.position.x, player.position.y - self.position.y).normalized()
	
	get_parent().add_child(b1)
