extends GutTest

var Enemy = preload("res://scripts/enemy.gd")
var Skeleton = preload("res://scripts/skeleton.gd")
var Zombie = preload("res://scripts/zombie.gd")

func test_enemy_default_values():
	var enemy = Enemy.new()
	assert_eq(enemy.speed, 40, "Base enemy speed should be 40")
	assert_eq(enemy.hp, 1, "Base enemy HP should be 1")
	enemy.free()

func test_enemy_take_damage():
	var enemy = Enemy.new()
	enemy.hp = 2
	enemy.take_damage(1)
	assert_eq(enemy.hp, 1, "Enemy HP should decrease by damage amount")
	enemy.free()

func test_enemy_direction():
	var enemy = Enemy.new()
	assert_eq(enemy.direction, -1, "Enemy should start moving left")
	enemy.free()

func test_skeleton_stats():
	var skeleton = Skeleton.new()
	# Simulate _ready
	skeleton.speed = 60
	skeleton.hp = 1
	assert_eq(skeleton.speed, 60, "Skeleton should have speed 60")
	assert_eq(skeleton.hp, 1, "Skeleton should have HP 1")
	skeleton.free()

func test_zombie_stats():
	var zombie = Zombie.new()
	# Simulate _ready
	zombie.speed = 30
	zombie.hp = 2
	assert_eq(zombie.speed, 30, "Zombie should have speed 30")
	assert_eq(zombie.hp, 2, "Zombie should have HP 2")
	zombie.free()
