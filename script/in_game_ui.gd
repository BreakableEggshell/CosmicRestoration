extends Control

@onready var cooldown_label: Label = $PlayerUI/DashCooldown/VBoxContainer/CooldownTime
@onready var player = get_parent().get_parent() # Camera2D -> Player

func _ready():
	player.connect("dash_cooldown_updated", _on_dash_cooldown_updated)

func _on_dash_cooldown_updated(time_left):
	cooldown_label.text = str(round(time_left * 10) / 10.0)
