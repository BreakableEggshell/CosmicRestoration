extends State
class_name DashState

const DASH_SPEED := 400.0
var dash_direction := 0

var dash_ready = true

func enter():
	print("Entering dash state")
	player_animation.play("Move_Dash")

	# Check which direction to dash into, and dash to that
	dash_direction = Input.get_axis("move_left", "move_right")
	var player = state_machine.player

	if dash_direction == 0:
		dash_direction = -1 if player_sprite.flip_h else 1

	# Dash and player's y velocity is forced to 0
	player.velocity.y = 0

	# Start dash duration
	$DashTime.start()
	$DashCooldownTime.start()

func physics_update(delta: float):
	var player = state_machine.player

	player.velocity.x = dash_direction * DASH_SPEED
	player.velocity.y = 0

	player.move_and_slide()

func _on_dash_time_timeout() -> void:
	dash_ready = false
	
	var character = state_machine.player
	
	if not character.is_on_floor():
		state_machine.change_state("fallstate")
	else:
		var direction = Input.get_axis("move_left", "move_right")
		if direction != 0:
			state_machine.change_state("walkstate")
		else:
			state_machine.change_state("idlestate")

func _on_dash_cooldown_time_timeout() -> void:
	dash_ready = true
