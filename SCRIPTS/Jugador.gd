extends KinematicBody2D
class_name Jugador, "res://Arte/v1.1 dungeon crawler 16X16 pixel pack/heroes/knight/knight_idle_anim_f0.png"

const FRICCION:float= 0.15
export(int) var aceleracion: int = 40
export(int) var velocidad_maxima: int = 100

onready var animated_sprite: AnimatedSprite = get_node("AnimatedSprite")

var mov_direction: Vector2 = Vector2.ZERO
var velocidad: Vector2 = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	velocidad =move_and_slide(velocidad)
	velocidad = lerp(velocidad, Vector2.ZERO, FRICCION)
	
func move() -> void: 
	mov_direction = mov_direction.normalized()
	velocidad += mov_direction * aceleracion
	
	#velocidad = velocidad.clamped(velocidad_maxima)
