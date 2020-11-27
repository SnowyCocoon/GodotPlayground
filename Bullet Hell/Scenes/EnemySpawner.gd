extends Node2D

onready var enmemy_scene_1 = load("res://Objects/Enemy1.tscn")
onready var enmemy_scene_2 = load("res://Objects/Enemy2.tscn")
var enemy
onready var timer = $Timer

func _ready():
	timer.set_wait_time(3)
	timer.start()


func _on_Timer_timeout():
	var enemy_num = rand_range(0,100)
	if(enemy_num>50):
		enemy = enmemy_scene_1.instance()
	else:
		enemy = enmemy_scene_2.instance()
	
	randomize()
	enemy.position.x = rand_range(50, 910)
	enemy.position.y = -100
	add_child(enemy)
