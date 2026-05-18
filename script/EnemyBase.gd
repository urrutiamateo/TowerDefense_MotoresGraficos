extends Area2D

@export var velocidad : float = 100
@export var vida_max : int = 100
@export var daño_nexo : int = 1

var vida_actual
var path_follow : PathFollow2D

func _ready() -> void:
	vida_actual = vida_max
	path_follow = get_parent()

func _process(delta: float) -> void:
	path_follow.progress += velocidad * delta
	if path_follow.progress_ratio >= 1.0:
		alcanzar_nexo()

func take_damage(cantidad):
	vida_actual -= cantidad

	if vida_actual <= 0:
		die()

func die():
	queue_free()

func alcanzar_nexo():
	print("Enemy alcanzo el nexo")
	queue_free()
