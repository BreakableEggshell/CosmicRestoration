extends State

func enter():
	player.player_animation.play("Move_Run")

func physics_update(delta: float) -> void:
	var dir := Input.get_axis("move_left","move_right")
	player.velocity.x = dir * player.SPEED
	
	if not player.is_on_floor():
		state_machine.change_state(player.jump_state)
		return
	
	if Input.is_action_just_pressed("move_jump"):
		state_machine.change_state(player.jump_state)
		return
	
	if dir == 0:
		state_machine.change_state(player.idle_state)
