extends Control



func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://ESCENAS/mundo_1.tscn")


func _on_opciones_pressed() -> void:
	pass # Replace with function body.


func _on_salir_pressed() -> void:
	get_tree().quit()
