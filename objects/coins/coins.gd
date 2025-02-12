extends Node2D

@onready var game = get_tree().current_scene;

func _ready() -> void:
	$AnimatedSprite2D.play("default");

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugadores"):
		$Area2D.queue_free();
		$AnimatedSprite2D.play("claimed");
		game.add_coins(1);

func _on_animated_sprite_2d_animation_finished() -> void:
	if ($AnimatedSprite2D.animation == "claimed"): queue_free();
