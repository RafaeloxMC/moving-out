extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 48.0

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
		animated_sprite_2d.play("walk")
	else:
		velocity = Vector2.ZERO
		animated_sprite_2d.play("default")
		
	if direction.x > 0:
		animated_sprite_2d.flip_h = false
	else:
		if direction.x < 0:
			animated_sprite_2d.flip_h = true
	move_and_slide()
