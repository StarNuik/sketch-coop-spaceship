extends CharacterBody2D

class_name Pilot

# Top-down pilot controller.
#
# Reads WASD input, normalizes diagonals so diagonal movement is never faster
# than axis-aligned movement, applies move_and_slide() for instant-stop,
# wall-sliding movement, and toggles horizontal facing when the movement
# direction reverses.
#
# Spec note: the tasks reference Sprite2D.mirror_y (Godot 3 terminology). In
# Godot 4.x horizontal flipping is Sprite2D.flip_h; this is what is used here
# and the behavior matches the spec (flip left<->right, unchanged during
# vertical-only movement).

@export var move_speed: float = 300.0

@onready var sprite: Sprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	# Input.get_vector normalizes diagonal input automatically.
	var input_direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * move_speed

	# Instant stop: velocity is recomputed from input every frame, so releasing
	# all keys stops the pilot immediately. move_and_slide() makes the capsule
	# collide with solid geometry and slide along walls instead of penetrating
	# them.
	move_and_slide()

	# Toggle horizontal facing when the horizontal direction reverses.
	# Vertical-only movement leaves the facing unchanged.
	if input_direction.x > 0:
		sprite.flip_h = false
	elif input_direction.x < 0:
		sprite.flip_h = true
