extends State
class_name WalkState

func enter():
	print("Entering walk state")

func physics_update(delta: float):
	var character = state_machine.player

	var direction = Input.get_axis("move_left", "move_right")

	character.velocity.x = direction * WALK_SPEED
	character.move_and_slide()

	# Idle
	if direction == 0:
		state_machine.change_state("idlestate")
		return
	
	# Jump
	if Input.is_action_just_pressed("move_jump") && character.is_on_floor():
		state_machine.change_state("jumpstate")
		return
	
	# Fall
	if not character.is_on_floor():
		state_machine.change_state("fallstate")
