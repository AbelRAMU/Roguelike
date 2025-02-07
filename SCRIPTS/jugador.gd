extends CharacterBody2D

var velocidad := 120
var direccion:= 0.0
var salto := -250
const gravedad := 9.8
var monedas :=0

@onready var monedasCont:Label = $ContadorDeMonedas
@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D

func _physics_process(delta:):
	direccion = Input.get_axis("ui_left", "ui_right")
	velocity.x = direccion * velocidad
	
	if direccion != 0:
		anim.play("correr")
		
	else:
		anim.play("quieto")
		
	sprite.flip_h = direccion < 0 if direccion != 0 else sprite.flip_h
	
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		
		velocity.y = salto
		
	if !is_on_floor():
		anim.play("salto")
		velocity.y += gravedad
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("monedas"):
		monedas += 1
		print ("Tu dinero es: ", monedas)
		monedasCont.text = str("Monedas: ",monedas)
