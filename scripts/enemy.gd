extends CharacterBody2D

@export var speed := 40
@export var hp := 1

func take_damage(dmg):
    hp -= dmg
    if hp <= 0:
        queue_free()
