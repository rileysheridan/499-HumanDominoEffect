extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var LobbyContainer = $Lobby_Container
onready var LevelSelectContainer = $LevelSelect_Container
onready var WaitRoomContainer = $WaitRoom_Container


var local_ip = get_local_ip()


# Called when the node enters the scene tree for the first time.
func _ready():
	LevelSelectContainer.visible = false
	WaitRoomContainer.visible = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Host_pressed():
	if get_name() == "":
		set_error_label("Invalid name!")
		return

	set_error_label("")
	# Load the level select menu with transition
	change_menu_smoothly(LobbyContainer, LevelSelectContainer)




func _on_Join_Button_pressed():
	if get_name() == "":
		set_error_label("Invalid name!")
		return
	
	#var ip =  $Connect/JoinBox/IPAddress.text
	#if not ip.is_valid_ip_address():
		#set_error_text("Invalid IP Address")
		#return
		
	#get host name
	var host_name = $Connect/JoinBox/IPAddress.text
	if host_name == $Connect/StartBox/Name.text:
		set_error_label("Host and player can not have the same name.")
		return

	set_error_label("")
	$Connect/Host.disabled = true
	$Connect/Join.disabled = true

	var player_name = get_name()
	#$Players/FindPublicIP.text = "IP: " + $Connect/IPAddress.text
	$Players/FindPublicIP.text = "Host: " + host_name

	#gamestate.join_game(ip, player_name)
	gamestate.join_game(host_name, player_name)


func change_menu_smoothly(prev, target):
	var prev_animation = prev.get_node("AnimationPlayer")
	var target_animation = target.get_node("AnimationPlayer")
	
	prev_animation.play_backwards("start")
	
	yield(prev_animation, "animation_finished")
	prev.visible = false
	target.visible = true
	
	target_animation.play("start")
	
	

func refresh_lobby():
	var players = gamestate.get_player_list()
	players.sort()
	$WaitRoom_Container/HBoxContainer/MenuContainer/Menu/MarginContainer/VBoxContainer/VBoxContainer/Menu/MarginContainer/ItemList.clear()
	for p in players:
		$WaitRoom_Container/HBoxContainer/MenuContainer/Menu/MarginContainer/VBoxContainer/VBoxContainer/Menu/MarginContainer/ItemList.add_item(p)

	$WaitRoom_Container/HBoxContainer/MenuContainer/Menu/MarginContainer/VBoxContainer/Start_Button.disabled = not get_tree().is_network_server()


# handle which level to begin at / randomize dominos
func handle_level(level):
	gamestate.first_level = level

	for top in range(10):
		for bottom in range(top + 1):
			gamestate.dominos.append([bottom, top])

	randomize()
	gamestate.random_seed = randi() % 10000000
	seed(gamestate.random_seed)

	gamestate.dominos.shuffle()
	
	
	# Set host username and ip address labels
	$WaitRoom_Container/HBoxContainer/MenuContainer/Menu/MarginContainer/VBoxContainer/Host_Username.set_text("Host: " + get_name())
	$WaitRoom_Container/HBoxContainer/MenuContainer/Menu/MarginContainer/VBoxContainer/Host_IP.set_text("Host IP: " + local_ip)
	
	
	# Change menu to waiting room
	change_menu_smoothly(LevelSelectContainer, WaitRoomContainer)
	
	
	
	var player_name = get_name()
	gamestate.host_game(player_name)
	refresh_lobby()
	
	
	
##### VVV HELPER FUNCTIONS VVV #####

func get_name() -> String:
	return $Lobby_Container/HBoxContainer/MenuContainer/Menu/MarginContainer/VBoxContainer/Name/NinePatchRect/MarginContainer/LineEdit.text
	
func set_name(name: String):
	$Lobby_Container/HBoxContainer/MenuContainer/Menu/MarginContainer/VBoxContainer/Name/NinePatchRect/MarginContainer/LineEdit.set_text(name)

func set_error_label(text: String):
	$Lobby_Container/HBoxContainer/MenuContainer/Menu/Error_Label.set_text(text)

func get_local_ip():
	var ip_address = "null"
	
	if OS.has_feature("Windows"):
		ip_address = IP.resolve_hostname(str(OS.get_environment("COMPUTERNAME")),1)
	elif OS.has_feature("X11") or OS.has_feature("OSX"):
		ip_address = IP.resolve_hostname(str(OS.get_environment("HOSTNAME")),1)
	
	
	return ip_address


##### VVV LEVEL SELECT BUTTONS VVV #####

func _on_Char_Creation_pressed():
	handle_level("Agency")


func _on_Pond_Choices_pressed():
	handle_level("Pond")


func _on_Domino_Game_pressed():
	handle_level("DominoWorld")


func _on_Virtual_World_pressed():
	handle_level("Sandbox")
	


func _on_Start_Button_pressed():
	gamestate.begin_game()
