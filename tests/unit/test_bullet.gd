extends GutTest

var Bullet = preload("res://scripts/bullet.gd")

func test_bullet_default_values():
	var bullet = Bullet.new()
	assert_eq(bullet.speed, 300, "Bullet speed should be 300")
	assert_eq(bullet.damage, 1, "Bullet damage should be 1")
	bullet.free()

func test_bullet_direction():
	var bullet = Bullet.new()
	assert_eq(bullet.direction, 1, "Bullet should default to moving right")
	bullet.direction = -1
	assert_eq(bullet.direction, -1, "Bullet direction should be changeable")
	bullet.free()
