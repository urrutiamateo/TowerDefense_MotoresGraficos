extends Node

@export var enemy_fast: PackedScene
@export var enemy_tank: PackedScene

func crear_enemigo(tipo: String) -> Node2D:
	match  tipo:
		"fast":
			return enemy_fast.instantiate()
		"tank":
			return enemy_tank.instantiate()
		_:
			push_error("Tipo de enemigo desconocido: %s" % tipo)
			return null
