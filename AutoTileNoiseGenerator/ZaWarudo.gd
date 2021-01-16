extends Node2D

var noise
var map_size = Vector2(50, 50)
var grass_cap = 0.3
var enviroment_caps = 0.1

func _ready():
	randomize()
	noise = OpenSimplexNoise.new()
	noise.seed = randi()
	noise.octaves = 1.0
	noise.period = 12
#	noise.persistence = 0.7
	make_grass_map()
	make_enviroment_map()
	
func make_grass_map():
	for x in map_size.x:
		for y in map_size.y:
			var a = noise.get_noise_2d(x,y)
			if a < grass_cap:
				$Grass.set_cell(x,y,0)
				
	$Grass.update_bitmask_region(Vector2(0.0, 0.0), Vector2(map_size.x, map_size.y))

func make_enviroment_map():
	for x in range(1,map_size.x-1,1):
		for y in range(1,map_size.y-1,1):
			var a = noise.get_noise_2d(x,y)
			if a < enviroment_caps:
				var chance = randi() % 100
				if chance < 5:
					var num = randi() % 15
					$Enviroment.set_cell(x,y, num)
					randomize()
