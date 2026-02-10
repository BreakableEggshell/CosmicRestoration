extends State
class_name JumpState

const JUMP_VELOCITY := -400.0
const GRAVITY := 980.0

func enter():
	print("Entering jump state")
	var character = state_machine.get_parent()
	character.velocity.y =  JUMP_VELOCITY

func physics_update(delta: float):
	var character = state_machine.get_parent()
	
	character.velocity.y += GRAVITY * delta
	
	var direction = Input.get_axis("move_left", "move_right")
	character.velocity.x = direction * 200
	
	character.move_and_slide()
	
	if character.is_on_floor():
		if direction != 0:
			state_machine.change_state("walkstate")
		else:
			state_machine.change_state("idlestate")
