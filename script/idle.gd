extends State

func enter():
	player.velocity.x = 0
	player.player_animation.play("Move_Idle")

func physics_update(delta: float) -> void:
	if Input.is_action_just_pressed("move_jump") and player.is_on_floor():
		state_machine.change_state(player.jump_state)
	elif Input.get_axis("move_left", "move_right") != 0:
		state_machine.change_state(player.run_state)
	elif Input.is_action_just_pressed("move_dash") and player.can_dash:
		state_machine.change_state(player.dash_state)
