extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

const refDict = {
	"cave.ogg": "res://audio/background/cave.ogg",
	"main.ogg": "res://audio/background/main.ogg",
	"pond.ogg": "res://audio/background/pond.ogg",
	"quantum.ogg": "res://audio/background/quantum.ogg",
	
	"back.wav": "res://audio/effects/back.wav",
	"next.wav": "res://audio/effects/next.wav",
	"select.wav": "res://audio/effects/back.wav",	
	
	"Lobby.tscn": "res://Scenes/Lobby.tscn",
	"Quit_Scene.tscn": "res://Scenes/Quit_Scene.tscn",
	"GAME_START.tscn": "res://Scenes/GAME_START.tscn",
	"Title_Scene.tscn": "res://Scenes/Title_Scene.tscn",
	"Menu_Scene.tscn": "res://Scenes/Menu_Scene.tscn",
	
	"Agency.tscn": "res://levels/Agency.tscn",
	"CharacterCreation.tscn": "res://levels/CharacterCreation.tscn",
	"DominoWorld.tscn": "res://levels/DominoWorld.tscn",
	"level1.tscn": "res://levels/level1.tscn",
	"level1_cont.tscn": "res://levels/level1_cont.tscn",
	"Manager.tscn": "res://levels/Manager.tscn",
	"Pond.tscn": "res://levels/Pond.tscn",
	"Sandbox.tscn": "res://levels/Sandbox.tscn",
	"Stone.tscn": "res://levels/Stone.tscn",
	"String.tscn": "res://levels/String.tscn",
	
	"Parallax1.tscn": "res://Scenes/Backgrounds/Parallax1.tscn",
	"Parallax2.tscn": "res://Scenes/Backgrounds/Parallax2.tscn",
	"Parallax3.tscn": "res://Scenes/Backgrounds/Parallax3.tscn",
	
	"FootprintTile.gd": "res://Scripts/FootprintTile.gd",
	
	"front_hair/0.png": "res://sprites/character_sprites/front_hair/0.png",
	"front_hair/1.png": "res://sprites/character_sprites/front_hair/1.png",
	"front_hair/2.png": "res://sprites/character_sprites/front_hair/2.png",
	"front_hair/3.png": "res://sprites/character_sprites/front_hair/3.png",
	"front_hair/4.png": "res://sprites/character_sprites/front_hair/4.png",
	"front_hair/5.png": "res://sprites/character_sprites/front_hair/5.png",
	"front_hair/6.png": "res://sprites/character_sprites/front_hair/6.png",
	"front_hair/7.png": "res://sprites/character_sprites/front_hair/7.png",
	"front_hair/8.png": "res://sprites/character_sprites/front_hair/8.png",
	"front_hair/9.png": "res://sprites/character_sprites/front_hair/9.png",
	"front_hair/10.png": "res://sprites/character_sprites/front_hair/10.png",
	"front_hair/11.png": "res://sprites/character_sprites/front_hair/11.png",
	
	"back_hair/0.png": "res://sprites/character_sprites/back_hair/0.png",
	"back_hair/1.png": "res://sprites/character_sprites/back_hair/1.png",
	"back_hair/2.png": "res://sprites/character_sprites/back_hair/2.png",
	"back_hair/3.png": "res://sprites/character_sprites/back_hair/3.png",
	"back_hair/4.png": "res://sprites/character_sprites/back_hair/4.png",
	"back_hair/5.png": "res://sprites/character_sprites/back_hair/5.png",
	"back_hair/6.png": "res://sprites/character_sprites/back_hair/6.png",
	"back_hair/7.png": "res://sprites/character_sprites/back_hair/7.png",
	"back_hair/8.png": "res://sprites/character_sprites/back_hair/8.png",
	"back_hair/9.png": "res://sprites/character_sprites/back_hair/9.png",
	"back_hair/10.png": "res://sprites/character_sprites/back_hair/10.png",
	"back_hair/11.png": "res://sprites/character_sprites/back_hair/11.png",
	
	"bodies/0.png": "res://sprites/character_sprites/bodies/0.png",
	"bodies/1.png": "res://sprites/character_sprites/bodies/1.png",
	"bodies/2.png": "res://sprites/character_sprites/bodies/2.png",
	"bodies/3.png": "res://sprites/character_sprites/bodies/3.png",
	
	"clothes/0.png": "res://sprites/character_sprites/clothes/0.png",
	"clothes/1.png": "res://sprites/character_sprites/clothes/1.png",
	"clothes/2.png": "res://sprites/character_sprites/clothes/2.png",
	"clothes/3.png": "res://sprites/character_sprites/clothes/3.png",
	"clothes/4.png": "res://sprites/character_sprites/clothes/4.png",
	
	"faces/0.png": "res://sprites/character_sprites/faces/0.png",
	"faces/1.png": "res://sprites/character_sprites/faces/1.png",
	"faces/2.png": "res://sprites/character_sprites/faces/2.png",
	"faces/3.png": "res://sprites/character_sprites/faces/3.png",
	
	"dominos/00.png": "res://sprites/dominos/00.png",
	"dominos/01.png": "res://sprites/dominos/01.png",
	"dominos/02.png": "res://sprites/dominos/02.png",
	"dominos/03.png": "res://sprites/dominos/03.png",
	"dominos/04.png": "res://sprites/dominos/04.png",
	"dominos/05.png": "res://sprites/dominos/05.png",
	"dominos/06.png": "res://sprites/dominos/06.png",
	"dominos/07.png": "res://sprites/dominos/07.png",
	"dominos/08.png": "res://sprites/dominos/08.png",
	"dominos/09.png": "res://sprites/dominos/09.png",
	"dominos/11.png": "res://sprites/dominos/11.png",
	"dominos/12.png": "res://sprites/dominos/12.png",
	"dominos/13.png": "res://sprites/dominos/13.png",
	"dominos/14.png": "res://sprites/dominos/14.png",
	"dominos/15.png": "res://sprites/dominos/15.png",
	"dominos/16.png": "res://sprites/dominos/16.png",
	"dominos/17.png": "res://sprites/dominos/17.png",
	"dominos/18.png": "res://sprites/dominos/18.png",
	"dominos/19.png": "res://sprites/dominos/19.png",
	"dominos/22.png": "res://sprites/dominos/22.png",
	"dominos/23.png": "res://sprites/dominos/23.png",
	"dominos/24.png": "res://sprites/dominos/24.png",
	"dominos/25.png": "res://sprites/dominos/25.png",
	"dominos/26.png": "res://sprites/dominos/26.png",
	"dominos/27.png": "res://sprites/dominos/27.png",
	"dominos/28.png": "res://sprites/dominos/28.png",
	"dominos/29.png": "res://sprites/dominos/29.png",
	"dominos/33.png": "res://sprites/dominos/33.png",
	"dominos/34.png": "res://sprites/dominos/34.png",
	"dominos/35.png": "res://sprites/dominos/35.png",
	"dominos/36.png": "res://sprites/dominos/36.png",
	"dominos/37.png": "res://sprites/dominos/37.png",
	"dominos/38.png": "res://sprites/dominos/38.png",
	"dominos/39.png": "res://sprites/dominos/39.png",
	"dominos/44.png": "res://sprites/dominos/44.png",
	"dominos/45.png": "res://sprites/dominos/45.png",
	"dominos/46.png": "res://sprites/dominos/46.png",
	"dominos/47.png": "res://sprites/dominos/47.png",
	"dominos/48.png": "res://sprites/dominos/48.png",
	"dominos/49.png": "res://sprites/dominos/49.png",
	"dominos/55.png": "res://sprites/dominos/55.png",
	"dominos/56.png": "res://sprites/dominos/56.png",
	"dominos/57.png": "res://sprites/dominos/57.png",
	"dominos/58.png": "res://sprites/dominos/58.png",
	"dominos/59.png": "res://sprites/dominos/59.png",
	"dominos/66.png": "res://sprites/dominos/66.png",
	"dominos/67.png": "res://sprites/dominos/67.png",
	"dominos/68.png": "res://sprites/dominos/68.png",
	"dominos/69.png": "res://sprites/dominos/69.png",
	"dominos/77.png": "res://sprites/dominos/77.png",
	"dominos/88.png": "res://sprites/dominos/88.png",
	"dominos/89.png": "res://sprites/dominos/89.png",
	"dominos/99.png": "res://sprites/dominos/99.png",
}

func get_reference(ref_key):
	return refDict[ref_key]
#	pass
