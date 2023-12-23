extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_button_back_pressed():
	get_tree().change_scene("res://accesorios/menu/main_menu/main_menu.tscn")


func _on_connect_server_pressed():
	get_tree().change_scene("res://accesorios/menu/network_test_client_01/network_connect_test_01.tscn")


func _on_create_server_pressed():
	get_tree().change_scene("res://accesorios/menu/create_server/create_server.tscn")
