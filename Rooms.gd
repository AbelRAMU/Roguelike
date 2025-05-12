extends Navigation2D

const SPAWN_ROOMS: Array = [preload("res://Rooms/SpawnRoom0.tscn"), preload("res://Rooms/SpawnRoom1.tscn")]
const INTERMEDIATE_ROOMS: Array = [preload("res://Rooms/Room0.tscn"), preload("res://Rooms/Room1.tscn"), preload("res://Rooms/Room2.tscn")]
const END_ROOMS: Array = [preload("res://Rooms/EndRoom0.tscn")]

const TILE_SIZE: int = 16
const FLOOR_TILE_INDEX: int = 6
const RIGHT_WALL_TILE_INDEX: int = 28
const LEFT_WALL_TILE_INDEX: int = 29

export(int) var num_levels: int = 5

onready var player: KinematicBody2D = get_parent().get_node("Player")


func _ready() -> void:
	_spawn_rooms()
	
	
func _spawn_rooms() -> void:
	var previous_room: Node2D
	
	for i in num_levels:
		var room: Node2D
		
		if i == 0:
			room = SPAWN_ROOMS[randi() % SPAWN_ROOMS.size()].instance()
			player.position = room.get_node("PlayerSpawnPos").position
			
		add_child(room)
		previous_room = room
