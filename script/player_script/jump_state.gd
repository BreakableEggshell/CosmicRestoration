extends State
class_name JumpState

@onready var dash_state: DashState = $"../DashState"

func enter():
	print("Entering jump state")
	player_animation.play("Move_Jump")
	var character = state_machine.player
	character.velocity.y =  JUMP_VELOCITY

func physics_update(delta: float):
	var character = state_machine.player
	
	# Apply gravity
	character.velocity.y += GRAVITY * delta
	
	# Allow left & right movement
	var direction = Input.get_axis("move_left", "move_right")
	character.velocity.x = direction * WALK_SPEED
	character.move_and_slide()
	
	# Player sprite direction
	if direction > 0:
		player_sprite.flip_h = false
	elif direction < 0:
		player_sprite.flip_h = true
	
	# Upward motion finished -> fall
	if character.velocity.y > 0:
		state_machine.change_state("fallstate")

func handle_input(event: InputEvent):
	if event.is_action_pressed("move_dash") and dash_state.dash_ready:
		state_machine.change_state("dashstate")
