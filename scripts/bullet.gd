extends Area2D

@export var speed := 300
@export var damage := 1

func _process(delta):
    position.x += speed * delta
