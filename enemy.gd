
extends Area2D

var speed = 250
var scored = false

func _ready():
	var body = get_node_or_null("EnemyBody")

	if body is ColorRect:
		var colors = [
			Color.RED,
			Color.YELLOW,
			Color.GREEN,
			Color.ORANGE,
			Color.PURPLE
		]
		body.color = colors.pick_random()
	else:
		print("EnemyBody not found!")

func _process(delta):
	position.y += speed * delta

	if position.y > 720 and not scored:
		scored = true
		get_tree().call_group("game_manager", "add_score")
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().call_group("game_manager", "game_over")
