extends Node
class_name StateMachine

var current_state: State
@onready var player = get_parent()

func _ready():
	for child in get_children():
		if child is State:
			child.player = player
			child.state_machine = self

func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
	current_state = new_state
	current_state.enter()

func physics_update(delta: float) -> void:
	current_state.physics_update(delta)
	
