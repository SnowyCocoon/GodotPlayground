extends VehicleBody

############################################################
# behaviour values

export var MAX_ENGINE_FORCE = 90.0
export var MAX_BRAKE_FORCE = 5.0
export var MAX_STEER_ANGLE = 0.35

export var steer_speed = 1.0

var steer_target = 0.0
var steer_angle = 0.0

############################################################
# Input

export var joy_steering = JOY_ANALOG_LX
export var steering_mult = -1.0
export var joy_throttle = JOY_ANALOG_R2
export var throttle_mult = 1.0
export var back_throttle_mult = -0.5
export var joy_brake = JOY_ANALOG_L2
export var brake_mult = 1.0

var back = JOY_DPAD_DOWN
var back_mult = -0.5


##############################################################
# Nitro
onready var nitroL = $ExhaustLeft/Particles
onready var nitroR = $ExhaustRight/Particles



func _ready():
	pass

func _physics_process(delta):
	

	var brake_val = 0
	var throttle_val = 0
	var steer_val = steering_mult * Input.get_joy_axis(0, joy_steering)
	
	if(Input.get_joy_axis(0, joy_throttle) > 0):	
		throttle_val = (throttle_mult * Input.get_joy_axis(0, joy_throttle))
		if Input.is_action_pressed("Boost"):
			throttle_val = (throttle_mult* 2 * Input.get_joy_axis(0, joy_throttle))
			print("Turbo")
			nitroL.show()
			nitroR.show()
		else:
			nitroL.hide()
			nitroR.hide()
		print(throttle_val)
	
	if(Input.get_joy_axis(0, joy_brake) > 0):
		throttle_val = (back_throttle_mult * Input.get_joy_axis(0, joy_brake))
		if(linear_velocity.length() >= 3):
			brake_val = brake_mult * Input.get_joy_axis(0, joy_brake)
			print("Brake") 
	
	if Input.is_action_pressed("H-Brake"):
		brake_val = brake_mult * 2
		print("Hand Brake")
	
	
	
	# overrules for keyboard
	if Input.is_action_pressed("ui_up"):
		throttle_val = 1.0
	#if Input.is_action_pressed("back"):
	#	throttle_val = -0.5
	#	print("dzaiala")
	if Input.is_action_pressed("ui_down"):
		brake_val = 1.0
	if Input.is_action_pressed("ui_left"):
		steer_val = 1.0
	elif Input.is_action_pressed("ui_right"):
		steer_val = -1.0
	
	engine_force = throttle_val * MAX_ENGINE_FORCE
	brake = brake_val * MAX_BRAKE_FORCE
	
	steer_target = steer_val * MAX_STEER_ANGLE
	if (steer_target < steer_angle):
		steer_angle -= steer_speed * delta
		if (steer_target > steer_angle):
			steer_angle = steer_target
	elif (steer_target > steer_angle):
		steer_angle += steer_speed * delta
		if (steer_target < steer_angle):
			steer_angle = steer_target
	
	steering = steer_angle
