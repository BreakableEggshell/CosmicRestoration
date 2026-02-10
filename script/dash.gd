extends State

func enter():
	player.can_dash = false
	
	player.velocity.y = 0
	player.velocity.x = player.dash_direction * player.DASH_SPEED
	
	player.player_animation.play("Move_Walk")
	
	player.dash_timer.start()

func physics_update(delta: float) -> void:
	player.velocity.y = 0

func exit():
	player.dash_cooldown_timer.start()
