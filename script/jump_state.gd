extends State
class_name JumpState

const JUMP_VELOCITY := -400.0
const GRAVITY := 980.0

func enter():
	print("Entering jump state")
	var character = state_machine.player
	character.velocity.y =  JUMP_VELOCITY

func physics_update(delta: float):
	var character = state_machine.player
	
	character.velocity.y += GRAVITY * delta
	character.move_and_slide()
	
	# Upward motion finished -> fall
	if character.velocity.y > 0:
		state_machine.change_state("fallstate")
