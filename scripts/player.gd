extends CharacterBody2D

signal hp_changed(new_hp: int)
signal died

@export var speed := 120
@export var jump_force := -300
@export var gravity := 800
@export var max_hp := 3
@export var fire_rate := 0.4

var hp: int
var can_shoot := true
var facing_right := true

@onready var shoot_origin: Marker2D = $ShootOrigin
@onready var sprite: Sprite2D = $Sprite2D

const BULLET_SCENE = preload("res://scenes/bullet.tscn")

func _ready():
	add_to_group("player")
	hp = max_hp
	hp_changed.emit(hp)
	GameManager.register_player(self)

func _physics_process(delta):
	# Gravity
	velocity.y += gravity * delta

	# Horizontal movement
	var dir = Input.get_axis("move_left", "move_right")
	velocity.x = dir * speed

	# Update facing direction
	if dir != 0:
		facing_right = dir > 0
		sprite.flip_h = not facing_right
		shoot_origin.position.x = 16 if facing_right else -16

	# Jump
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_force

	# Shooting
	if Input.is_action_just_pressed("shoot") and can_shoot:
		shoot()

	move_and_slide()

func shoot():
	can_shoot = false
	var bullet = BULLET_SCENE.instantiate()
	bullet.position = global_position + shoot_origin.position
	bullet.direction = 1 if facing_right else -1
	get_tree().current_scene.add_child(bullet)

	# Fire rate cooldown
	await get_tree().create_timer(fire_rate).timeout
	can_shoot = true

func take_damage(amount: int):
	hp -= amount
	hp_changed.emit(hp)
	if hp <= 0:
		die()

func die():
	died.emit()
	# Disable player control
	set_physics_process(false)
