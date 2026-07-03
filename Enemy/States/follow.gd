class_name EnemyFollow extends EnemyState
var move_speed = 90
var move_direction: Vector2
@export var enemy: CharacterBody2D
var player: CharacterBody2D
var anim: AnimatedSprite2D

func Enter() -> void:
	player = get_tree().get_first_node_in_group("Player")
	anim = enemy.get_node("AnimatedSprite2D")
	anim.play("Run")

func Update(_delta: float):
	if not is_instance_valid(player):
		return
	move_direction = player.global_position - enemy.global_position
	
	# Flip sprite sesuai arah gerakan
	if move_direction.x != 0:
		anim.flip_h = move_direction.x < 0

func PhysicsUpdate(_delta: float):
	if move_direction.length() > 40:
		enemy.velocity = move_direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2.ZERO
	if move_direction.length() > 150:
		Transitioned.emit(self, 'idle')
	if move_direction.length() < 40:
		Transitioned.emit(self, 'attack')
