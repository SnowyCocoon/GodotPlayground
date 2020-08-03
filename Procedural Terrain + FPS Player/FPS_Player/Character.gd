extends KinematicBody

var speed
var default_speed = 7
var sprint_speed = 14
var acceleration = 50
var gravity = 9.8
var jump = 5
#var blink_dist = 15

var damage = 100

var mouse_sensitivity = 0.1

var sprinting = false

var direction = Vector3()
var velocity = Vector3()
var fall = Vector3() 

onready var head = $Head
onready var sprint_timer = $SprintTimer
onready var aimcast = $Head/Camera/AimCast
onready var muzzle = $Head/Gun/Muzzle
onready var bullet = preload("res://FPS_Player/Bullet.tscn")

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
	
	if Input.is_action_just_pressed("fire"):
		if aimcast.is_colliding():
			var b = bullet.instance()
			muzzle.add_child(b)
			b.look_at(aimcast.get_collision_point(), Vector3.UP)
			b.shoot = true
	
	if not is_on_floor():
		fall.y -= gravity * delta
	
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		fall.y = jump
		
	if Input.is_action_just_pressed("sprint") and not sprinting:
		sprinting = true
		sprint_timer.start()
	elif Input.is_action_just_pressed("sprint") and sprinting:
		sprinting = false
		
	if sprinting:
		speed = sprint_speed
	
	if Input.is_action_pressed("up"):
	
		direction -= transform.basis.z
			
	
	elif Input.is_action_pressed("down"):
		
		direction += transform.basis.z
			
		
	if Input.is_action_pressed("left"):
		
		direction -= transform.basis.x
			
		
	elif Input.is_action_pressed("right"):
		
		direction += transform.basis.x
			
		
	direction = direction.normalized()
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta) 
	velocity = move_and_slide(velocity, Vector3.UP, true, 4, 50) 
	move_and_slide(fall, Vector3.UP, true, 4, 50)

func _on_SprintTimer_timeout():
	sprinting = false
