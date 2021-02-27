extends RigidBody

remote func _set_position(pos): #synching all player positions in the network
	global_transform.origin = pos

#func _physics_process(delta):
#	rpc_unreliable("_set_position", global_transform.origin) #clients are controling other remotely


#func _on_Box_body_entered(body):
#	rpc_unreliable("_set_position", global_transform.origin) #clients are controling other remotely
