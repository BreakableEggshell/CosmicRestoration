extends State

func enter():
	player.velocity.y = player.JUMP_VELOCITY
	player.player_animation.play("Move_Jump")

func physics_update(delta: float) -> void:
	player.velocity += player.get_gravity() * delta
	
	if player.is_on_floor():
		state_machine.change_state(player.idle_state)
