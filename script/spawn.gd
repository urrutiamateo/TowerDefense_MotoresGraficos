extends Node2D

@export var enemigo_escena : PackedScene
@onready var path_follow : PathFollow2D = get_parent().get_node("Path2D/PathFollow2D")

func _ready():
	print("PathFollow2D encontrado:", path_follow)
	var timer = Timer.new()
	timer.wait_time = 4.0
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)
	timer.timeout.connect(spawn_enemigo)

func spawn_enemigo():
	var path_follow_instancia = PathFollow2D.new()
	get_parent().get_node("Path2D").add_child(path_follow_instancia)
	
	var enemigo = enemigo_escena.instantiate()
	path_follow_instancia.add_child(enemigo)
	
	enemigo.path_follow = path_follow_instancia
	enemigo.path_follow.progress = 0
	
	print("Enemigo instanciado:", enemigo)
