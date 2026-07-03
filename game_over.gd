extends Control

func _ready():
	$Button.pressed.connect(_on_restart_pressed)

func _on_restart_pressed():
	get_tree().reload_current_scene()
	queue_free()
