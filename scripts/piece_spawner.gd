extends Node

var current_tetromino
var bag: Array = []

@onready var board = $"../Board" as Board

func _ready():
	randomize()
	board.tetromino_locked.connect(on_tetromino_locked)
	spawn_next_piece()

func on_tetromino_locked():
	spawn_next_piece()

func spawn_next_piece():
	current_tetromino = get_next_piece()
	board.spawn_tetromino(current_tetromino, false, null)

func generate_bag():
	var pieces = [
		Shared.Tetromino.i, 
		Shared.Tetromino.o, 
		Shared.Tetromino.t, 
		Shared.Tetromino.j, 
		Shared.Tetromino.l, 
		Shared.Tetromino.s, 
		Shared.Tetromino.z
	]
	pieces.shuffle()
	bag.append_array(pieces)

func get_next_piece():
	if bag.is_empty():
		generate_bag()
	return bag.pop_front()
