extends CharacterBody2D

@export var speed: float = 300.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D as AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("pilot_left", "pilot_right", "pilot_up", "pilot_down")
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()

	if direction != Vector2.ZERO:
		animated_sprite.play("walk")
		# Face the way the pilot walks horizontally.
		if direction.x < 0:
			animated_sprite.flip_h = true
		elif direction.x > 0:
			animated_sprite.flip_h = false
	else:
		animated_sprite.play("idle")
