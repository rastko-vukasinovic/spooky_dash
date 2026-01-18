extends Node2D

func _on_level_end_body_entered(body: Node2D):
	if body.is_in_group("player"):
		GameManager.level_complete()
