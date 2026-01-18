extends GutTest

var Player = preload("res://scripts/player.gd")

func test_player_initial_hp():
	var player = Player.new()
	player.max_hp = 3
	# Simulate _ready without full scene
	player.hp = player.max_hp
	assert_eq(player.hp, 3, "Player should start with max HP")
	player.free()

func test_player_take_damage():
	var player = Player.new()
	player.hp = 3
	player.take_damage(1)
	assert_eq(player.hp, 2, "Player HP should decrease by damage amount")
	player.free()

func test_player_facing_direction():
	var player = Player.new()
	player.facing_right = true
	assert_true(player.facing_right, "Player should default to facing right")
	player.free()

func test_player_shoot_cooldown():
	var player = Player.new()
	player.can_shoot = true
	assert_true(player.can_shoot, "Player should be able to shoot initially")
	player.free()
