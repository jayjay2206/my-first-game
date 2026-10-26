
extends Node2D

var enemy_scene = preload("res://Enemy.tscn")

func _ready():
	spawn_enemy()

func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	enemy.position = Vector2(randi_range(250, 550), -50)
	add_child(enemy)

	await get_tree().create_timer(1.5).timeout
	spawn_enemy()
