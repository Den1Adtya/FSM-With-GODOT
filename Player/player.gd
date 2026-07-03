class_name Player
extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var bar_fill = $HealthBarContainer/BarFill
const SPEED = 200.0

var health = 100
var max_health = 100
var is_dead = false

func _ready():
	update_health_bar()

func _physics_process(_delta: float) -> void:
	if is_dead:
		return
		
	var direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	velocity = direction * SPEED
	move_and_slide()
	
	if direction == Vector2.ZERO:
		anim.play("Idle")
	else:
		anim.play("Walk")
	
	if direction.x < 0:
		anim.flip_h = true
	elif direction.x > 0:
		anim.flip_h = false

func take_damage(amount):
	if is_dead:
		return
	health -= amount
	health = max(health, 0)
	print("HP Teroris: ", health)
	update_health_bar()
	if health <= 0:
		die()

func update_health_bar():
	var percent = float(health) / float(max_health)
	bar_fill.size.x = 50 * percent

func die():
	is_dead = true
	anim.play("Death")
	await anim.animation_finished
	await get_tree().create_timer(1.5).timeout
	show_game_over()

func show_game_over():
	var game_over = preload("res://GameOver.tscn").instantiate()
	get_tree().root.add_child(game_over)
