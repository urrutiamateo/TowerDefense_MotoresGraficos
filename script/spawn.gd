extends Node

@export var factory : Node
@onready var path = $"../Path2D"

func spawn_oleada(tipos: Array) -> Array:
	var enemigos = []
	for tipo in tipos:
		var enemigo = factory.create_enemy(tipo)
		if enemigo:
			var pf = PathFollow2D.new()
			path.add_child(pf)
			enemigo.path_follow = pf
			add_child(enemigo)
			enemigos.append(enemigo)
	return enemigos
