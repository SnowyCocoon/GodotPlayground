extends Node2D



var bullet = load("res://Objects/Bullet2.tscn")
onready var timer = $Timer
onready var player = get_parent().get_node("Player")

func _ready():
	timer.set_wait_time(1)
	timer.start()

func _process(delta):
	rotate(1 * delta)
	#spawn_bullets()
	
func spawn_bullets():
	var b1 = bullet.instance()
	b1.position = self.position
	b1.direction = Vector2(player.position.x - self.position.x, player.position.y - self.position.y).normalized()
	
	get_parent().add_child(b1)



func _on_Timer_timeout():
	spawn_bullets()
