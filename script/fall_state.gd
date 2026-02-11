extends State
class_name FallState

func enter():
	print("Entering Fall State")
	player_animation.play("Move_Fall")

func physics_update(delta: float):
	var character = state_machine.player
	
	# Apply gravity to player
	character.velocity.y += GRAVITY * delta
	
	# Let player move move left or right while in air
	var direction = Input.get_axis("move_left", "move_right")
	character.velocity.x = direction * WALK_SPEED
	character.move_and_slide()
	
	# Player sprite direction
	if direction > 0:
		player_sprite.flip_h = false
	elif direction < 0:
		player_sprite.flip_h = true
	
	# Transition to next state
	if character.is_on_floor():
		if direction != 0:
			state_machine.change_state("walkstate")
		else:
			state_machine.change_state("idlestate")
