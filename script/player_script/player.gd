extends CharacterBody2D

signal dash_cooldown_updated(time_left)

@onready var dash_cooldown_timer: Timer = $StateMachine/DashState/DashCooldownTimer

func _process(delta):
	if not dash_cooldown_timer.is_stopped():
		emit_signal("dash_cooldown_updated", dash_cooldown_timer.time_left)
	else:
		emit_signal("dash_cooldown_updated", 0.0)
