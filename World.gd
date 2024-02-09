extends Node2D

var borders = Rect2(1, 1, 38, 21)

@onready var tileMap = $TileMap

func _ready():
	randomize()
	generate_level()

func generate_level():
	var walker = Walker.new(Vector2(19, 11), borders)
	var map = walker.walk(200)
	
	walker.queue_free()
	
	var tile_set:TileSet = $TileMap.get_tileset()
	var ground_layer = 0
	var id = tile_set.get_source_id(0)

	var used_cells = map
	tileMap.set_cells_terrain_connect(ground_layer, used_cells, 0, id)

func reload_level():
	get_tree().reload_current_scene()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		reload_level()
