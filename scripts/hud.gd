extends CanvasLayer

@onready var hp_label: Label = $HPLabel
@onready var message_label: Label = $MessageLabel

func _ready():
	GameManager.hp_updated.connect(_on_hp_updated)
	GameManager.game_over.connect(_on_game_over)
	GameManager.level_completed.connect(_on_level_completed)
	message_label.visible = false

func _on_hp_updated(hp: int):
	hp_label.text = "HP: " + str(hp)

func _on_game_over():
	message_label.text = "GAME OVER\nPress R to restart"
	message_label.visible = true

func _on_level_completed():
	message_label.text = "LEVEL COMPLETE!\nPress R to restart"
	message_label.visible = true
