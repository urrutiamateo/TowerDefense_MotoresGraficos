extends Area2D

signal enemy_dead

@export var velocidad : float = 100
@export var vida_max : int = 100
@export var daño_nexo : int = 1

var vida_actual
var path_follow : PathFollow2D

func _ready() -> void:
	add_to_group("enemigos")
	vida_actual = vida_max

func _process(delta: float) -> void:
	if path_follow != null:
		path_follow.progress += velocidad * delta
		global_position = path_follow.global_position

func take_damage(cantidad):
	vida_actual -= cantidad
	if vida_actual <= 0:
		die()

func die():
	emit_signal("enemy_dead")
	queue_free()
