extends Node2D

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected") #1. Detects if client joined the server, 2. Where will function run, 3. func name


func _on_ButtonHost_pressed():
	var net = NetworkedMultiplayerENet.new() #Creates new multiplayer network
	net.create_server(6969,2) #Port number/max num of clients
	get_tree().set_network_peer(net) #Open the peer or connecting with it
	print("hosting")

func _on_ButtonJoin_pressed():
	var net = NetworkedMultiplayerENet.new() #Creates new multiplayer network
	net.create_client("127.0.0.1", 6969) #Nowy klient na danym ID/Port
	get_tree().set_network_peer(net) #Open the peer or connecting with it

func _player_connected(id):
	Globals.player2id = id #id z globalnego singletona (autoload)
	var game = preload("Game.tscn").instance()
	get_tree().get_root().add_child(game)
	hide()
