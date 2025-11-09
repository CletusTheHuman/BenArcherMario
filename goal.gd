extends Area2D
@export var win_screen: PackedScene

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player") and win_screen:
		get_tree().change_scene_to_packed(win_screen)
