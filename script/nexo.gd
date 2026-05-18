extends Area2D

@export var vida_max: int = 15
var vida_actual: int

func _ready() -> void:
	vida_actual = vida_max
	connect("area_entered", Callable(self, "_on_area_entered"))

func recibir_daño(cantidad):
	vida_actual -= cantidad
	if vida_actual <= 0:
		game_over()

func game_over():
	print("El nexo ha sido destruido")

func _on_area_entered(area: Area2D):
	if area.is_in_group("enemigos"):
		recibir_daño(area.daño_nexo)
		area.queue_free()
