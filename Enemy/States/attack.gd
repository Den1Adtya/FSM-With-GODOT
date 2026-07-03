class_name EnemyAttack extends EnemyState
@export var enemy: CharacterBody2D
var player: CharacterBody2D
var anim: AnimatedSprite2D
var attack_cooldown = 1.0
var can_attack = true
var attack_damage = 10

func Enter() -> void:
	player = get_tree().get_first_node_in_group("Player")
	anim = enemy.get_node("AnimatedSprite2D")
	can_attack = true

func Update(_delta: float):
	if not is_instance_valid(player):
		return
	var dir = player.global_position - enemy.global_position
	
	# Flip sprite sesuai arah player
	if dir.x != 0:
		anim.flip_h = dir.x < 0
	
	# Kalau player menjauh, kembali follow
	if dir.length() > 60:
		Transitioned.emit(self, "follow")

func PhysicsUpdate(_delta: float):
	enemy.velocity = Vector2.ZERO
	if can_attack:
		do_attack()

func do_attack():
	if not is_instance_valid(player):
		return
	
	# Pastikan flip benar saat mulai menyerang
	var dir = player.global_position - enemy.global_position
	if dir.x != 0:
		anim.flip_h = dir.x < 0
	
	anim.play("Attack")
	can_attack = false
	player.take_damage(attack_damage)
	print("Polisi menyerang! Damage: ", attack_damage)
	await anim.animation_finished
	await get_tree().create_timer(attack_cooldown).timeout
	can_attack = true

func Exit():
	can_attack = true
