extends "res://script/EnemyBase.gd"

func _ready() -> void:
	velocidad = 60
	vida_max = 250
	daño_nexo = 3
	super._ready()
