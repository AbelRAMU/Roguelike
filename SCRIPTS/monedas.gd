extends StaticBody2D
var direccion:= 0.0

@onready var anim: AnimationPlayer = $AnimationPlayer

func _physics_process(delta:):
	anim.play("Moneda")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugadores"):
		queue_free()
		
	
