extends Control

const LEVEL_PATH := "res://level.tscn"   
const MENU_PATH  := "res://start_menu.tscn" 

@onready var replay_btn: Button = $MarginContainer/VBoxContainer/ReplayButton
@onready var menu_btn:   Button = $MarginContainer/VBoxContainer/MenuButton

func _ready() -> void:
	replay_btn.pressed.connect(_on_replay)
	menu_btn.pressed.connect(_on_menu)

func _on_replay() -> void:
	get_tree().change_scene_to_file(LEVEL_PATH)

func _on_menu() -> void:
	get_tree().change_scene_to_file(MENU_PATH)
