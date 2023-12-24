extends Control


# Declare member variables here. Examples:
##Timer
var timer
##server
var server

##BUTTONS
#start the server
var button_server_connect
#update the current server status to the text area
var button_server_status
#shows the current clients connected to the server
var button_server_clients
#stops the server
var button_server_stop
#this button will get the current ip
var button_current_ip

##TEXT AREAS
#this shows on the text area who's connected to the server
var text_area_current_connections
#this updates the current server notification from OFF to ON
var text_area_server_status

##EDIT AREA
#this can be edited for the user, it will show the current IP adress and PORT
var edit_area_ip
var edit_area_port
var port


# Called when the node enters the scene tree for the first time.
func _ready():
	#timer
	timer = get_node("Timer")
	#ui elements; INNIT
	button_server_connect = get_node("button_server_connect")
	button_server_status = get_node("button_server_status")
	button_server_clients = get_node("button_server_clients")
	button_server_stop = get_node("button_server_stop")
	text_area_current_connections = get_node("text_area_current_connected")
	text_area_server_status = get_node("text_area_server_status")
	edit_area_ip = get_node("edit_area_ip")
	edit_area_port = get_node("edit_area_port")
	
	#Innit the app
	timer.start()
	button_server_connect.disabled = true
	
	##networking stuff
	server = NetworkedMultiplayerENet.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_button_back_pressed():
	server.close_connection()
	get_tree().change_scene("res://accesorios/menu/connect/connect.tscn")


func _on_button_server_connect_pressed():
	port = edit_area_port.text
	port = int(port)
	print(port) ##THIS TO DEBUG
	start_server()
	#print(edit_area_port)
	#print(edit_area_port.text)

func _on_button_server_status_pressed():
	pass # Replace with function body.


func _on_button_server_clients_pressed():
	pass # Replace with function body.


func _on_button_server_stop_pressed():
	stop_server()


func _on_button_current_ip_pressed():
	pass # Replace with function body.

##use this to start the server up
##use this to start the server up
func start_server():
	var result = server.create_server(port)

	if result == OK:
		print("Server started on port", port)
		# Additional setup or logic can go here
	elif result == ERR_ALREADY_IN_USE:
		print("Error: Server already in use. Close existing connection first.")
	elif result == ERR_CANT_CREATE:
		print("Error: Unable to create the server")
	else:
		print("Unknown error:", result)


func stop_server():
	server.close_connection()
	print("Server stopped")


func _on_Timer_timeout():
	text_area_server_status.text ="Server status : OFF"
	button_server_connect.disabled = false
