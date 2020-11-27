extends Node2D

var p_bullet = load("res://Objects/Player_Bullet.tscn")
onready var timer = $Timer

var health = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.set_wait_time(0.2)
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position = get_global_mouse_position()
	if(health <= 0):
		die()
	#if Input.is_action_just_pressed("Shoot"):
		

func advance_status():
	get_parent().get_node("HealthLabel").text = get_parent().health_status[health]


func _on_Timer_timeout():
	var b = p_bullet.instance()
	get_parent().add_child(b)
	b.position = self.position
	
func die():
	get_tree().paused = true
	get_parent().remove_child(self)
	queue_free()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
