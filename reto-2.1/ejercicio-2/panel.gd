
extends Node2D

@onready var hud: Label = $Hud

# Contadores para la tecla D
var cuadro_d := 0
var evento_d := 0

# Informacion del ultimo evento
var clase_evento := "Ninguno"
var dispositivo := "Ninguno"
var tipo_senal := "Ninguna"
var detalle_evento := "Esperando entrada"


func _physics_process(_delta: float) -> void:
	# SONDEO: contar cuadros con D presionada
	if Input.is_action_pressed("move_right"):
		cuadro_d += 1

	# Leer las acciones del teclado
	var salto = Input.is_action_pressed("jump")
	var eje = Input.get_axis("move_left", "move_right")
	var fuerza = Input.get_action_strength("move_right")

	# Actualizar el panel HUD
	hud.text = (
		"PANEL DE CONTROLES\n" +
		"------------------------------\n" +
		"Jump: %s\n" % str(salto) +
		"Get Axis: %.2f\n" % eje +
		"Move Right Strength: %.2f\n" % fuerza +
		"\n" +
		"ULTIMO EVENTO\n" +
		"Clase: %s\n" % clase_evento +
		"Dispositivo: %s\n" % dispositivo +
		"Tipo de senal: %s\n" % tipo_senal +
		"Detalle: %s\n" % detalle_evento +
		"\n" +
		"CONTADORES TECLA D\n" +
		"Sondeo (cuadros): %d\n" % cuadro_d +
		"Eventos recibidos: %d" % evento_d
	)



func _input(event: InputEvent) -> void:
	# Ignorar las repeticiones del teclado
	if event is InputEventKey and event.is_echo():
		return

	# Obtener clase y dispositivo
	clase_evento = event.get_class()
	dispositivo = str(event.device)

	# Identificar el movimiento del raton
	if event is InputEventMouseMotion:
		tipo_senal = "Posicion"
		detalle_evento = "Movimiento del raton"

	# Identificar clics y rueda del raton
	elif event is InputEventMouseButton:
		if event.button_index in [
			MOUSE_BUTTON_WHEEL_UP,
			MOUSE_BUTTON_WHEEL_DOWN,
			MOUSE_BUTTON_WHEEL_LEFT,
			MOUSE_BUTTON_WHEEL_RIGHT
		]:
			tipo_senal = "Digital"
			detalle_evento = "Rueda del raton"
		else:
			tipo_senal = "Digital"
			detalle_evento = "Clic del raton"

	# Identificar teclado
	elif event is InputEventKey:
		tipo_senal = "Digital"
		detalle_evento = "Teclado"

	# Identificar mando analogico
	elif event is InputEventJoypadMotion:
		tipo_senal = "Analogica"
		detalle_evento = "Movimiento del mando"

	elif event is InputEventJoypadButton:
		tipo_senal = "Digital"
		detalle_evento = "Boton del mando"

	else:
		tipo_senal = "No identificada"
		detalle_evento = "Otro evento"

	# Contar eventos de la tecla D
	if event.is_action_pressed("move_right"):
		evento_d += 1
