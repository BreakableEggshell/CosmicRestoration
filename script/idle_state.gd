extends State
class_name IdleState

func enter():
	print("Entering idle state")
	player_animation.play("Move_Idle")

func physics_update(delta: float):
	var character = state_machine.player
	
	var direction = Input.get_axis("move_left", "move_right")
	
	# Fall
	if not character.is_on_floor():
		state_machine.change_state("fallstate")
	
	# Jump
	if Input.is_action_just_pressed("move_jump"):
		state_machine.change_state("jumpstate")
	
	# Walk
	if direction != 0:
		state_machine.change_state("walkstate")
		return
	

'''
func handle_input(event: InputEvent):
	if Input.is_action_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		state_machine.change_state("walkstate")
	elif Input.is_action_just_pressed("move_jump"):
		state_machine.change_state("jumpstate")
'''
