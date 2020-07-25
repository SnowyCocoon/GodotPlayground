extends Spatial

var planet = null

func _ready():
	planet = Planet.new(2)
	add_child(planet)
