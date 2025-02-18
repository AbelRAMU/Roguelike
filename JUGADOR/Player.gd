extends Jugador

func _process(_delta: float) -> void:
	var mouse_direccion: Vector2 =(get_global_mouse_position() - global_position).normalized()
	
	if mouse_direccion.x > 0 and animated_sprite.flip_h:
		animated_sprite.flip_h = false 
		
	elif mouse_direccion.x < 0 and not animated_sprite.flip_h:
		animated_sprite.flip_h = true 

func get_input() -> void:
	
	mov_direction = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		mov_direction += Vector2.DOWN
	if Input.is_action_pressed("ui_left"):
		mov_direction += Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		mov_direction += Vector2.RIGHT
	if Input.is_action_pressed("ui_up"):
		mov_direction += Vector2.UP
