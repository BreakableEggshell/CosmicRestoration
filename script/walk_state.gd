extends State
class_name WalkState

const WALK_SPEED := 200.0

func enter():
	print("Entering walk state")

func physics_update(delta: float):
	var character = state_machine.get_parent()
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction == 0:
		state_machine.change_state("idlestate")
		return
	
	character.velocity.x = direction * WALK_SPEED
	character.move_and_slide()

func handle_input(event):
	if Input.is_action_just_pressed("move_jump"):
		state_machine.change_state("jumpstate")
