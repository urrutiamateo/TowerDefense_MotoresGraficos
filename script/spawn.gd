extends Node

@export var factory : Node
@onready var path = $"../Path2D"

var oleadas = [
	["fast", "fast", "fast", "fast", "fast"],          
	["tank", "tank", "tank"],                  
	["fast", "tank", "fast", "tank", "fast"]   
]

var oleada_actual = 0
var indice_enemigo = 0

func _ready():
	spawn_next_enemy()

func spawn_next_enemy():
	if oleada_actual >= oleadas.size():
		print("¡Todas las oleadas terminadas! Victoria 🎉")
		return

	if indice_enemigo >= oleadas[oleada_actual].size():
		oleada_actual += 1
		indice_enemigo = 0
		print("Oleada terminada, preparando la siguiente...")
		await get_tree().create_timer(3.0).timeout
		spawn_next_enemy()
		return

	var tipo = oleadas[oleada_actual][indice_enemigo]
	var enemigo = factory.crear_enemigo(tipo)

	if enemigo:
		var pf = PathFollow2D.new()
		path.add_child(pf)
		enemigo.path_follow = pf
		add_child(enemigo)

	indice_enemigo += 1
	await get_tree().create_timer(1.5).timeout
	spawn_next_enemy()
