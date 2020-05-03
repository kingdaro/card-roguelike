extends Node2D

var floor_tile_texture = load("res://assets/dungeon2/tiles.png")
var player_texture = load("res://assets/adventurer/adventurer-idle-00.png")

const grid_size = Vector2(7, 5)
const grid_scale = 32

var player_grid_position = (grid_size / 2).floor()

var player: Sprite
var camera: Camera2D

func _ready():
	var floor_container = Node2D.new()
	add_child(floor_container, true)
	
	for x in range(grid_size.x):
		for y in range(grid_size.y):
			floor_container.add_child(create_floor_tile(x, y), true)
	
	player = Sprite.new()
	player.texture = player_texture
	add_child(player)

	camera = Camera2D.new()
	camera.current = true
	add_child(camera)

func _process(_delta):
	player.position = player_grid_position * grid_scale
	camera.position = player.position

func create_floor_tile(grid_x: float, grid_y: float):
	var floor_tile = Sprite.new()
	floor_tile.texture = floor_tile_texture
	floor_tile.region_rect = Rect2(336, 96, 32, 32)
	floor_tile.region_enabled = true
	floor_tile.position = Vector2(grid_x, grid_y) * grid_scale
	floor_tile.visible = true
	return floor_tile
