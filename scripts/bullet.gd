extends Area2D

@export var speed := 300
@export var damage := 1

var direction := 1

func _process(delta):
	position.x += speed * direction * delta

func _on_body_entered(body: Node2D):
	if body.has_method("take_damage"):
		body.take_damage(damage)
	queue_free()

func _on_screen_exited():
	queue_free()

func _on_lifetime_timer_timeout():
	queue_free()
