extends Area2D

@export var velocidad : float = 100
@export var vida_max : int = 100
@export var daño_nexo : int = 1

var vida_actual
var path_follow : PathFollow2D

func _ready() -> void:
	vida_actual = vida_max

func _process(delta: float) -> void:
	if path_follow != null:
		path_follow.progress += velocidad * delta
		global_position = path_follow.global_position

		var path_length = path_follow.get_parent().curve.get_baked_length()
		if path_follow.progress >= path_length - 1.0: # margen de 1 pixel
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
