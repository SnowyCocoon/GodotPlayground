tool
extends GridMap

var noise = OpenSimplexNoise.new()



func _ready()->void:
	noise.period = 80
	noise.octaves = 6
	for x in range(70):
		for y in range(70):
			for z in range(70):
				if y-5 < noise.get_noise_2d(x,z)*25+10:
					set_cell_item(x,y,z,0)
