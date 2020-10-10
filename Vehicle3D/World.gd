extends Spatial

func _ready():
	var noise = OpenSimplexNoise.new()
	noise.period = 200
	noise.octaves = 40
	noise.persistence = 0.1
	noise.lacunarity = 0.1
	
	var plane_mesh = PlaneMesh.new()
	plane_mesh.size = Vector2(1600,1600)
	plane_mesh.subdivide_depth = 200
	plane_mesh.subdivide_width = 200
	
	var surface_tool = SurfaceTool.new()
	surface_tool.create_from(plane_mesh,0)
	
	var array_plane = surface_tool.commit()
	var data_tool = MeshDataTool.new()
	data_tool.create_from_surface(array_plane,0)
	
	for i in range(data_tool.get_vertex_count()):
		var vertex = data_tool.get_vertex(i)
		vertex.y = noise.get_noise_3d(vertex.x,vertex.y,vertex.z) * 60
		data_tool.set_vertex(i, vertex)
		
	for i in range(array_plane.get_surface_count()):
		array_plane.surface_remove(i)
		
	data_tool.commit_to_surface(array_plane)
	surface_tool.begin(Mesh.PRIMITIVE_TRIANGLES)
	surface_tool.create_from(array_plane,0)
	surface_tool.generate_normals()
	
	var mesh_instance = MeshInstance.new()
	mesh_instance.mesh = surface_tool.commit()
	mesh_instance.set_surface_material(0, load("res://Terrain.material"))
	
	mesh_instance.create_trimesh_collision()
	add_child(mesh_instance)
	
	#for i in range(100):
	#	randomize()
	#	var x = rand_range(-400,400)
	#	var z = rand_range(-400,400)
	#	var e = enemy.instance()
	#	e.translation = Vector3(x,15,z)
	
	
