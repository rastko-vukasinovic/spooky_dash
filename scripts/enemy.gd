extends CharacterBody2D

@export var speed := 40
@export var hp := 1
@export var gravity := 800
@export var damage := 1

var direction := -1

func _ready():
	add_to_group("enemies")

func _physics_process(delta):
	# Apply gravity
	velocity.y += gravity * delta

	# Move horizontally
	velocity.x = direction * speed

	move_and_slide()

	# Turn around at walls or edges
	if is_on_wall():
		direction *= -1

	# Check for player collision
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider.has_method("take_damage") and collider.is_in_group("player"):
			collider.take_damage(damage)

func take_damage(dmg: int):
	hp -= dmg
	if hp <= 0:
		die()

func die():
	queue_free()
