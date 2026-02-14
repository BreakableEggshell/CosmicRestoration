extends CharacterBody2D
class_name Player

signal dash_cooldown_updated(time_left)

@onready var dash_cooldown_timer: Timer = $StateMachine/DashState/DashCooldownTimer
@onready var bow_draw_sprite: Sprite2D = $BowAnimation/Marker2D/BowDrawSprite
@onready var player_bow_arrow_sprite: Sprite2D = $"BowAnimation/PlayerBow&ArrowSprite"

func _ready():
	player_bow_arrow_sprite.visible = false
	bow_draw_sprite.frame = 0

func _process(delta):
	if not dash_cooldown_timer.is_stopped():
		emit_signal("dash_cooldown_updated", dash_cooldown_timer.time_left)
	else:
		emit_signal("dash_cooldown_updated", 0.0)
