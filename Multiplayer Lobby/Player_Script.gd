extends KinematicBody

var speed = 5

var direction = Vector3()

func _ready():
	pass

remote func _set_position(pos): #synching all player positions in the network
	global_transform.origin = pos

func _physics_process(delta):
	direction = Vector3()
	
	if Input.is_action_pressed("ui_left"):
		direction -= transform.basis.x
	elif Input.is_action_pressed("ui_right"):
		direction += transform.basis.x
	if Input.is_action_pressed("ui_up"):
		direction -= transform.basis.z
	elif Input.is_action_pressed("ui_down"):
		direction += transform.basis.z
	direction = direction.normalized()
	
	if direction != Vector3():
		if is_network_master(): #Jeżeli ty jesteś właścicielem tego node-a w sieci
			move_and_slide(direction * speed, Vector3.UP)
		rpc_unreliable("_set_position", global_transform.origin) #clients are controling other remotely
