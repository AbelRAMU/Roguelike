extends CharacterBody2D
@onready var abelito: AnimatedSprite2D = $Abelito
@onready var monedasCont:Label = $ContadorDeMonedas


const SPEED:float = 300.0
const JUMP_VELOCITY:float = -400.0
var monedas:int = 0
var vida:int = 50
var puedoAtacar:bool = true
var enemigoCol:bool=false
var enemigo = null
var damage:int = 5

func _ready():
	print("Tu vida es: ", vida)
	abelito.play("Idle")


func _physics_process(delta: float) -> void:
	var anim = abelito
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() or Input.is_action_just_pressed("ui_up") and is_on_floor() :
		velocity.y = JUMP_VELOCITY


	var directionX := Input.get_axis("ui_left", "ui_right")
	
	if directionX:
		
		anim.play("Walk")
		velocity.x = directionX * SPEED
	else:
		anim.play("Idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	


func _input(event):
	if event.is_action_pressed("ui_down"):
		if enemigo != null:
			Atacar(enemigo, damage)
	
func GameOver() -> void:
	if vida <=0:
		queue_free()
		
		
func _on_area_2d_body_entered(body):
	 
	if body.is_in_group("obstaculos"):
		vida -=10
		#vidaCont.text = str("Vida restante: ",vida)
		
	if body.is_in_group("enemigos"):
		enemigoCol=true
		enemigo = body
	
		
		
	if body.is_in_group("monedas"):
		monedas += 1
		print ("Tu dinero es: ", monedas)
		monedasCont.text = str("Monedas: ",monedas)
		
func Atacar(enemigo, damage) -> void:
	if puedoAtacar:
		enemigo.vida -= damage
		$Timer.start()
		puedoAtacar = false


func _on_timer_timeout() -> void:
	puedoAtacar = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("enemigos"):
		enemigoCol=false
