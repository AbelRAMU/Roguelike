extends CharacterBody2D

var velocidad := 100
var direccion:= 0.0
var salto := -210
const gravedad := 9.8


@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	animaciones()
	direccion = Input.get_axis("Mover_Izquierda", "Mover_Derecha")
	velocity.x = direccion * velocidad
	
	anim.flip_h = direccion < 0 if direccion != 0 else anim.flip_h
	
	if is_on_floor() and Input.is_action_just_pressed("Salto"):
		
		velocity.y = salto
		
	if !is_on_floor():
		velocity.y += gravedad
		
	move_and_slide()

func animaciones():
	if not is_on_floor():
		if velocity.y < 0:
			anim.play("salto")
		else:
			anim.play("caida")
		return
	
	if velocity.x: 
		anim.play("run")
	else:
		anim.play("idle")
