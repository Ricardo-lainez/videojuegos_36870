extends Node2D

@onready var label: Label = $Label

# Contadores individuales para W (move_up)
var cuadro_w := 0
var evento_w := 0

# Contadores individuales para S (move_down)
var cuadro_s := 0
var evento_s := 0

# Contadores individuales para A (move_left)
var cuadro_a := 0
var evento_a := 0

# Contadores individuales para D (move_right)
var cuadro_d := 0
var evento_d := 0

func _physics_process(_delta: float) -> void:
	# Revisamos cada tecla una por una
	if Input.is_action_pressed("move_up"):
		cuadro_w += 1
	
	if Input.is_action_pressed("move_down"):
		cuadro_s += 1
	
	if Input.is_action_pressed("move_left"):
		cuadro_a += 1
	
	if Input.is_action_pressed("move_right"):
		cuadro_d += 1
	
	# Actualizamos el texto mostrando los datos de las 4 teclas
	label.text = (
		"Tecla W -> Sondeo: %d | Eventos: %d\n" % [cuadro_w, evento_w] +
		"Tecla S -> Sondeo: %d | Eventos: %d\n" % [cuadro_s, evento_s] +
		"Tecla A -> Sondeo: %d | Eventos: %d\n" % [cuadro_a, evento_a] +
		"Tecla D -> Sondeo: %d | Eventos: %d" % [cuadro_d, evento_d]
	)

func _input(event: InputEvent) -> void:
	# Si el evento es un eco (mantener presionado), salimos de la función para no contarlo
	if event.is_echo():
		return
	
	# Evaluamos cada acción por separado
	if event.is_action("move_up"):
		evento_w += 1
	elif event.is_action("move_down"):
		evento_s += 1
	elif event.is_action("move_left"):
		evento_a += 1
	elif event.is_action("move_right"):
		evento_d += 1
