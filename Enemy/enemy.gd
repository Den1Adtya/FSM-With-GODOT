class_name Enemy extends CharacterBody2D

var health = 100
var is_dead = false

func _ready() -> void:
	position = Vector2(200, 200)

func _physics_process(_delta: float) -> void:
	if is_dead:
		return
	move_and_slide()

func take_damage(amount):
	if is_dead:
		return
	health -= amount
	print("HP Polisi: ", health)
	if health <= 0:
		die()

func die():
	is_dead = true
	collision_layer = 0
	collision_mask = 0
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 0.4)
	await tween.finished
	queue_free()
