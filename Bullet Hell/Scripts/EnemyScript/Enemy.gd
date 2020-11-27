extends Node2D

var bullet
onready var timer = $Timer
var speed = 75
var health = 4
onready var tween = $Move_Tween



func _ready():
	timer.set_wait_time(1)
	timer.start()
	var target = Vector2(self.position.x, self.position.y + 150)
	tween.interpolate_property(self, "position", position, target, 5, Tween.TRANS_QUINT, Tween.EASE_OUT)
	tween.start()
	
func _process(delta):
	rotate(1 * delta)
	position.y += speed * delta
	#spawn_bullets()
	
	if(position.y > get_viewport_rect().size.y + 20):
		get_parent().remove_child(self)
		queue_free()
		
	if health <= 0:
		die()

func spawn_bullets():
	pass

func _on_Timer_timeout():
	spawn_bullets()

func die():
	get_parent().get_parent().score += 100
	get_parent().get_parent().advance_status()
	get_parent().remove_child(self)
	queue_free()	
