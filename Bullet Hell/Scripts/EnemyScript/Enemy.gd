extends Node2D

var bullet
onready var timer = $Timer

func _ready():
	timer.set_wait_time(1)
	timer.start()

func _process(delta):
	rotate(1 * delta)
	#spawn_bullets()

func spawn_bullets():
	pass

func _on_Timer_timeout():
	spawn_bullets()
