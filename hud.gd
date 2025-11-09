extends CanvasLayer

@onready var coins_label: Label = $MarginContainer/HBoxContainer/CoinsLabel

func _ready() -> void:
	coins_label.text = "Coins: 0"
	var player := get_tree().get_first_node_in_group("player")
	if player:
		player.coins_changed.connect(_on_player_coins_changed)

func _on_player_coins_changed(new_value: int) -> void:
	coins_label.text = "Coins: %d" % new_value
