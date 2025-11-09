extends CharacterBody2D

signal  coins_changed(new_value)
var coins: int = 0

@onready var sprite = $AnimatedSprite2D
var speed: float = 250.0
var jump_force: float = -420.0
var is_jumping = false
var score = 0

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO

	if Input.is_action_pressed("right"):
		direction.x += 1
		sprite.flip_h = false
		if not is_jumping:
			sprite.play("walk")
	elif Input.is_action_pressed("left"):
		direction.x -= 1
		sprite.flip_h = true
		if not is_jumping:
			sprite.play("walk")
	else:
		if not is_jumping:
			sprite.play("idle")

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force
		is_jumping = true
		sprite.play("jump")

	velocity.x = direction.x * speed
	velocity.y += 900 * delta 
	move_and_slide()

	if is_on_floor():
		is_jumping = false

func collect_item(value: int) -> void:
	coins += value
	emit_signal("coins_changed", coins)
