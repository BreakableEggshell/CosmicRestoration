# To Do:
# Switch Dash to using the Timer Nodes

extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -400.0

const DASH_SPEED = 400.0
const DASH_TIME = 0.15
const DASH_COOLDOWN = 0.5

@onready var player_animation: AnimationPlayer = $AnimationPlayer
@onready var player_sprite: Sprite2D = $Sprite2D

# Dash Mechanics
var is_dashing := false
var dash_timer := 0.0
var dash_cooldown_timer := 0.0
var dash_direction := 0


func _physics_process(delta: float) -> void:

	if dash_cooldown_timer > 0:
		dash_cooldown_timer -= delta

	if is_dashing:
		dash_timer -= delta
		velocity.x = dash_direction * DASH_SPEED
		velocity.y = 0

		if dash_timer <= 0:
			is_dashing = false

	else:
		# Gravity
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Jump
		if Input.is_action_just_pressed("move_jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			

		# Movement
		var direction := Input.get_axis("move_left", "move_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		# Dash input
		if Input.is_action_just_pressed("move_dash") and dash_cooldown_timer <= 0:
			start_dash(direction)


	if is_dashing:
		player_animation.play("Move_Walk") 
	elif not is_on_floor():
		if player_animation.current_animation != "Move_Jump":
				player_animation.play("Move_Jump")
	elif is_on_floor():
		player_animation.play("Move_Walk" if velocity.x != 0 else "Move_Idle")
	else:
		player_animation.play("Move_Idle")

	# Sprite flip
	if velocity.x > 0:
		player_sprite.flip_h = false
	elif velocity.x < 0:
		player_sprite.flip_h = true
	move_and_slide()


func start_dash(direction: int) -> void:
	is_dashing = true
	dash_timer = DASH_TIME
	dash_cooldown_timer = DASH_COOLDOWN


	if direction == 0:
		dash_direction = -1 if player_sprite.flip_h else 1
	else:
		dash_direction = sign(direction)

func _on_dash_cooldown_time_timeout() -> void:
	pass # Replace with function body.

func _on_dash_time_timeout() -> void:
	pass # Replace with function body.
