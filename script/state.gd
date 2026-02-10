extends Node
class_name State

var player: CharacterBody2D
var state_machine

func enter() -> void: pass
func exit() -> void: pass
func physics_update(delta: float) -> void: pass
