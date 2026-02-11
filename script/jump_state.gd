extends State
class_name JumpState

func enter():
	print("Entering jump state")
	player_animation.play("Move_Jump")
	var character = state_machine.player
	character.velocity.y =  JUMP_VELOCITY

func physics_update(delta: float):
	var character = state_machine.player
	
	# Apply gravity
	character.velocity.y += GRAVITY * delta
	
	# Allow left & right movement
	var direction = Input.get_axis("move_left", "move_right")
	character.velocity.x = direction * WALK_SPEED
	character.move_and_slide()
	
	# Player sprite direction
	if direction > 0:
		player_sprite.flip_h = false
	elif direction < 0:
		player_sprite.flip_h = true
	
	# Upward motion finished -> fall
	if character.velocity.y > 0:
		state_machine.change_state("fallstate")
