extends Control

# Declare member variables here.
var ip_add
var port
var connect
var disc
var network_peer  # Variable to hold the network peer

# Called when the node enters the scene tree for the first time.
func _ready():
	ip_add = get_node("text_connect_ip")
	port = get_node("text_connect_port")
	connect = get_node("button_connect")
	disc = get_node("button_disconnect")

	network_peer = NetworkedMultiplayerENet.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
#     pass

func _on_button_leave_pressed():
	get_tree().change_scene("res://accesorios/menu/connect/connect.tscn")

func _on_button_connect_pressed():
	var server_ip = ip_add.text
	var server_port = int(port.text)  # Convert port to integer

	network_peer.create_client(server_ip, server_port)
	network_peer.connect("connected", self, "_on_connected")

func _on_connected():
	print("Connected to the server!")

	# You can add more logic here, such as changing scenes or enabling game functionality.
