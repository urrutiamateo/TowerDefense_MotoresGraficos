extends Node

@onready var spawner = $Spawner
@onready var nexo = $Nexo

var oleadas = [
	["fast", "fast", "fast", "fast", "fast"],          
	["tank", "tank", "tank"],                  
	["fast", "tank", "fast", "tank", "fast"]   
]

var oleada_actual = 0
var enemigos_vivos = 0

func _ready():
	nexo.connect("nexo_dañado", Callable(self, "_on_nexo_dañado"))
	siguiente_oleada()

func siguiente_oleada():
	if oleada_actual >= oleadas.size():
		print("¡Victoria! 🎉")
		return

	var wave = oleadas[oleada_actual]
	var enemigos = spawner.spawn_wave(wave)
	enemigos_vivos = enemigos.size()

	for e in enemigos:
		e.connect("enemy_dead", Callable(self, "_on_enemy_dead"))

func _on_enemy_dead():
	enemigos_vivos -= 1
	if enemigos_vivos <= 0:
		oleada_actual += 1
		print("Oleada terminada, preparate para la siguiente...")
		await get_tree().create_timer(3.0).timeout
		siguiente_oleada()

func _on_nexo_dañado(vida_restante):
	if vida_restante <= 0:
		print("El nexo ha sido destruido")
