extends Node

@export var factory : Node
@onready var path = $"../Path2D"

func spawn_oleada(tipos: Array) -> Array:
	var enemigos = []
	var offset = 0.0
	for tipo in tipos:
		var enemigo = factory.crear_enemigo(tipo)
		if enemigo:
			var pf = PathFollow2D.new()
			pf.progress = offset
			path.add_child(pf)
			enemigo.path_follow = pf
			add_child(enemigo)
			enemigos.append(enemigo)
			offset += 50.0
	return enemigos
