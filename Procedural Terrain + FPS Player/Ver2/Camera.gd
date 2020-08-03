extends Camera

func _process(delta):
	if(Input.is_mouse_button_pressed(1)):
		translation -= global_transform.basis.z * delta * 10
	
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * 0.3
		rotation_degrees.x -= event.relative.y * 0.3
