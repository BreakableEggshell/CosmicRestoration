extends Node
class_name State

var state_machine : StateMachine

@onready var player_animation: AnimationPlayer = $"../../AnimationPlayer"
@onready var player_sprite: Sprite2D = $"../../PlayerBasicMovementSprite"


const WALK_SPEED := 200.0
const GRAVITY := 980.0
const JUMP_VELOCITY := -400.0

func enter(): pass
func exit(): pass
func update(delta: float): pass
func physics_update(delta: float): pass
func handle_input(event: InputEvent): pass
