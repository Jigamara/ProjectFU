extends RigidBody2D

var initial_position: Vector2
var time_elapsed: float = 0.0
var is_running: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initial_position = global_position
	freeze = true



# Variables del algoritmo
var aceleration: float = 0.0
var gravity: float = 9.81
var cube_mass = 1
var weight = cube_mass * gravity





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_running: 
		time_elapsed += delta
		$"../timer".text = "Tiempo: " + "%.2f" % time_elapsed

		# Variables del algortimo
		var alpha = get_node("../StaticBody2D")
		alpha = alpha.angle
		var sin_alpha = sin_degrees(alpha)
		var co = 100
		var _hip = co / sin_alpha

		$"../VelocidadY".text = "Velocidad Y: " + str("%.2f" % (gravity * time_elapsed))
		$"../Aceleracion".text = "Aceleración: " + str("%.2f" % ((sin_alpha * weight) / cube_mass))
		$"../VelocidadX".text = "Velocidad X: " + str("%.2f" % (aceleration*time_elapsed))


	if Input.is_action_just_pressed("start"): 
		freeze = false
		is_running = true
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()

func sin_degrees(angle_degrees):
	return sin(deg_to_rad(angle_degrees))


func _on_fin_mapa_body_entered(_body: Node2D) -> void:
	print("Cube salio")
	is_running = false
