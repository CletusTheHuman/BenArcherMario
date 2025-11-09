extends Control
@export var level_scene: PackedScene

@onready var play_btn: Button = $MarginContainer/VBoxContainer/PlayButton
@onready var quit_btn: Button = $MarginContainer/VBoxContainer/QuitButton

func _ready() -> void:
	play_btn.pressed.connect(_on_play)
	quit_btn.pressed.connect(_on_quit)

func _on_play() -> void:
	if level_scene:
		get_tree().change_scene_to_packed(level_scene)

func _on_quit() -> void:
	get_tree().quit()
