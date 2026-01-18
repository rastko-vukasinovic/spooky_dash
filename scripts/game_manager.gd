extends Node

signal game_over
signal level_completed
signal hp_updated(hp: int)

var current_level := "res://scenes/levels/level_01.tscn"
var player: Node = null

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event):
	if event.is_action_pressed("restart"):
		restart_level()

func register_player(p: Node):
	player = p
	if player.has_signal("hp_changed"):
		player.hp_changed.connect(_on_player_hp_changed)
	if player.has_signal("died"):
		player.died.connect(_on_player_died)

func _on_player_hp_changed(new_hp: int):
	hp_updated.emit(new_hp)

func _on_player_died():
	game_over.emit()
	get_tree().paused = true

func level_complete():
	level_completed.emit()
	get_tree().paused = true

func restart_level():
	get_tree().paused = false
	get_tree().reload_current_scene()
