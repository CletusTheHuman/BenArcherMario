extends CharacterBody2D

@export var speed: float = 80.0
@export var gravity: float = 1200.0
@export var bounce_force: float = -300.0

var direction: int = -1
var alive: bool = true

func _physics_process(delta: float) -> void:
	if not alive:
		return

	velocity.x = direction * speed
	velocity.y += gravity * delta
	move_and_slide()

	if is_on_wall():
		direction *= -1

	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider and collider.is_in_group("player"):
			_handle_player_collision(collider, collision)

func _handle_player_collision(player: Node, collision: KinematicCollision2D) -> void:
	if not alive:
		return

	if collision.get_normal().y > 0.7:
		if "velocity" in player:
			player.velocity.y = bounce_force
		_die()

func _die() -> void:
	alive = false
	queue_free() 
