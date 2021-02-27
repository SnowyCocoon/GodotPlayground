extends Spatial

onready var player1pos = $Player1Spawn
onready var player2pos = $Player2Spawn

func _ready():
	print(player1pos.global_transform)
	print(player2pos.global_transform)
	
	var player1 = preload("res://Player.tscn").instance() #Tworzymy swoją postać
	player1.set_name(str(get_tree().get_network_unique_id())) #Unikalna nazwa dla gracza
	player1.set_network_master(get_tree().get_network_unique_id()) #ten gracz jest własicielem tego node
	player1.global_transform = player1pos.global_transform
	add_child(player1)
	
	var player2 = preload("res://Player.tscn").instance() #Tworzymy swoją postać
	player2.set_name(str(Globals.player2id))
	player2.set_network_master(Globals.player2id)
	player2.global_transform = player2pos.global_transform
	add_child(player2)
