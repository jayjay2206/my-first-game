
extends CharacterBody2D

var speed = 350

func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed
	velocity.y = 0
	move_and_slide()
	
