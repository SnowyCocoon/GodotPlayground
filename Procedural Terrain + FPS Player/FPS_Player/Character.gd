extends KinematicBody

var speed
var default_speed = 7
var sprint_speed = 14
var acceleration = 50
var gravity = 9.8
var jump = 5
var mouse_sensitivity = 0.1

var sprinting = false

var direction = Vector3()
var velocity = Vector3()
var fall = Vector3() 

onready var head = $Head

func _ready():
	
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) 
	
func _input(event):
	
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * mouse_sensitivity)) 
		head.rotate_x(deg2rad(-event.relative.y * mouse_sensitivity)) 
		head.rotation.x = clamp(head.rotation.x, deg2rad(-90), deg2rad(90))

func _physics_process(delta):
	
	speed = default_speed
	
	direction = Vector3()
	
	if not is_on_floor():
		fall.y -= gravity * delta
	
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		fall.y = jump
		
	if Input.is_action_pressed("sprint"):
		sprinting = true
		
	if sprinting:
		speed = sprint_speed
	
	if Input.is_action_pressed("ui_up"):
	
		direction -= transform.basis.z
			
	
	elif Input.is_action_pressed("ui_down"):
		
		direction += transform.basis.z
			
		
	if Input.is_action_pressed("ui_left"):
		
		direction -= transform.basis.x
			
		
	elif Input.is_action_pressed("ui_right"):
		
		direction += transform.basis.x
			
		
	direction = direction.normalized()
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta) 
	velocity = move_and_slide(velocity, Vector3.UP, true, 4, 50) 
	move_and_slide(fall, Vector3.UP, true, 4, 50)
