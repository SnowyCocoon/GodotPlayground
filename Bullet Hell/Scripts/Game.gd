extends Node2D

var score = 0

var health_status = ["You're dead 0/5",
					"You are wounded 1/5",
					"You are wounded 2/5",
					"You are wounded 3/5",
					"You are wounded 4/5",
					"Your angel is at full health 5/5"]

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func advance_status():
	get_node("PointLabel").text = "Score: " + str(score)
	
	if(score >= 1000):
		get_node("Spawner").timer.set_wait_time(2)
	if(score >= 2500):
		get_node("Spawner").timer.set_wait_time(1)
