extends State
class_name FallState

const GRAVITY := 980.0

func enter():
	print("Entering Fall State")

func physics_update(delta: float):
	var character = state_machine.player
	# Apply gravity to player
	character.velocity.y += GRAVITY * delta
	character.move_and_slide()

	if character.is_on_floor():
		var direction = Input.get_axis("move_left", "move_right")
	
		if direction != 0:
			state_machine.change_state("walkstate")
		else:
			state_machine.change_state("idlestate")
