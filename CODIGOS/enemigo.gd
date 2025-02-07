extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -200.0
var player = null
var playerCol:bool = false
var vida:int = 10
var damage:int = 10



func _ready():
	player = get_node("/root/Node2D/jugador/jugador")
	
	

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	if player != null:
		var direction = global_position.direction_to(player.global_position)
		velocity = get_gravity() * SPEED
	
		
		
		move_and_slide()
		Muerte()

func Ataque(player:CharacterBody2D, damage:int) -> void:
	if player != null:
		player.vida -= damage
		print(player.vida)
		$Timer.start()
	else:
		return
	
func Muerte() -> void:
	if vida <=0:
		queue_free()


func _on_area_2d_body_entered(body):	
	if body.name == "jugador":
		playerCol = true
		Ataque(body, damage)
		
	
	else:
		playerCol = false
		return
	


func _on_timer_timeout():
	if playerCol and player != null:
		Ataque(player, damage)
	else:
		return
		
