extends CharacterBody2D

var can_dash : bool = true
var dash_direction : int = 1

const SPEED = 150.0
const JUMP_VELOCITY = -400.0

const DASH_SPEED = 400.0

@onready var player_animation: AnimationPlayer = $AnimationPlayer
@onready var player_sprite: Sprite2D = $Sprite2D

@onready var dash_timer: Timer = $DashTimer
@onready var dash_cooldown_timer: Timer = $DashCooldownTimer

@onready var state_machine: StateMachine = $StateMachine
@onready var idle_state: State = $StateMachine/Idle
@onready var run_state: State  = $StateMachine/Run
@onready var jump_state: State  = $StateMachine/Jump
@onready var dash_state: State  = $StateMachine/Dash

func _ready():
	state_machine.change_state($StateMachine/Idle)

func _physics_process(delta: float) -> void:
	state_machine.physics_update(delta)
	move_and_slide()

func _on_dash_timer_timeout() -> void:
	state_machine.change_state($StateMachine/Idle)

func _on_dash_cooldown_timer_timeout() -> void:
	can_dash = true
