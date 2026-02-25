# Portal.gd
extends Area2D

@export var next_scene: PackedScene

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player"):
		if next_scene:
			get_tree().change_scene_to_packed(next_scene)
		else:
			push_warning("Portal has no scene assigned!")
