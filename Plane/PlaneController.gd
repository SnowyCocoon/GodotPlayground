extends Camera

####################
# EXPORT PARAMS
####################
# Speed
export (float, 1, 100) var speed = 10
export (float, 1, 3, 0.1) var turbo_modifier = 2
export (float, 3, 10, 0.5) var turbo_time = 5
# Yaw
export (float, 1, 100) var yaw_speed = 10
export (float, 10, 180, 1) var max_yaw = 70
# Roll
export (float, 10, 180, 1) var max_roll = 70
#  Pitch
export (float, 1, 100) var pitch_speed = 10
export (float, 10, 180, 1) var max_pitch = 30

####################
# PARAMS
####################
onready var model = $PlaneTu150


####################
# OVERRIDE FUNCTIONS
####################
func _physics_process(delta: float) -> void:
	_move(delta)
	_pitch(delta)
	_yaw(delta)
	
####################
# MOVEMENT FUNCTIONS
####################

func _move(delta: float) -> void:
	translation -= transform.basis.z * delta * speed
	
func _pitch(delta: float) -> void:
	var mouse_speed = _get_mouse_speed()
	rotation_degrees.x += mouse_speed.y * delta * pitch_speed
	var amount = abs(mouse_speed.y)
	var direction = sign(mouse_speed.y)
	model.rotation_degrees.x = lerp(0, max_pitch, amount) * direction
	
func _yaw(delta: float) -> void:
	var mouse_speed = _get_mouse_speed()
	rotation_degrees.y += mouse_speed.x * delta * pitch_speed
	_roll_and_yaw_model(mouse_speed.x, delta)
	

func _roll_and_yaw_model(mouse_speed_x: float, delta: float) -> void:
	var amount = abs(mouse_speed_x)
	var direction = sign(mouse_speed_x)
	model.rotation_degrees.y = lerp(0, max_yaw, amount) * direction
	model.rotation_degrees.z = lerp(0, max_roll, amount) * direction
####################
# HELPER FUNCTIONS
####################

func _get_mouse_speed() -> Vector2:
	var screen_center = get_viewport().size * 0.5
	var displacement = screen_center - get_viewport().get_mouse_position()
	displacement.x /= screen_center.x #Normalizing
	displacement.y /= screen_center.y #Normilizing 
	return displacement
