extends CharacterBody2D

@export var speed := 120
@export var jump_force := -300
@export var gravity := 800

func _physics_process(delta):
    velocity.y += gravity * delta
    var dir = Input.get_axis("move_left", "move_right")
    velocity.x = dir * speed
    if is_on_floor() and Input.is_action_just_pressed("jump"):
        velocity.y = jump_force
    move_and_slide()
