
# Respuestas - Reto 1

## Pregunta 1
Mantén D dos segundos y suéltala:
¿Qué contador subió más y por qué?

El contador de sondeo aumentó más porque
_physics_process() se ejecuta constantemente
mientras la tecla permanece presionada.

En cambio, el contador de eventos aumenta
cuando se recibe una pulsación nueva.
Las repeticiones automáticas se ignoran.

## Pregunta 2
Mantén A: ¿qué valor muestran get_axis
y get_action_strength("move_right")?

Get_axis muestra -1.00 y
get_action_strength("move_right") muestra 0.00.

Esto ocurre porque get_axis detecta la dirección
izquierda como negativa, mientras que
get_action_strength solo consulta la intensidad
de la acción move_right, que no está presionada.

## Pregunta 3
Gira la rueda del ratón:
¿Qué clase aparece y por qué su rama
va antes que la del clic?

Aparece InputEventMouseButton.

Esto ocurre porque Godot utiliza esa clase tanto
para los clics como para la rueda del ratón.

Por ese motivo, primero se comprueba si el
evento corresponde a la rueda. Si no corresponde,
se identifica como un clic del ratón.
