extends Node2D

var coins = 0;

func _ready() -> void:
	update_coins_label();

func add_coins(_amount : int) -> void:
	coins += _amount;
	update_coins_label();

func update_coins_label() -> void:
	$botones/Control/CoinsLabel.text = "Monedas: " + str(coins);
