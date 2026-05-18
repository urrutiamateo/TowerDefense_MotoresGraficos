extends "res://script/EnemyBase.gd"

func _ready() -> void:
	velocidad = 150
	vida_max = 80
	daño_nexo = 5
	super._ready()
