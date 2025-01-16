extends StaticBody2D

@export var angle = self.rotation_degrees


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(_delta: float) -> void:
	$"../Angle".text = "  Ángulo: " + ("%.f" % self.rotation_degrees)
	angle = self.rotation_degrees


	
func _input(_event):
	if Input.is_action_pressed("go_up"):
		rotate_up()
	if Input.is_action_pressed("go_down"):
		rotate_down()

func rotate_down():
	var move_amount = Vector2(-15, 0)
	
	if rotation_degrees <= 0:
		rotation_degrees = 90
		position = Vector2(153, 1267)
	else:
		if rotation_degrees >= 42:
			rotation_degrees -= 2
			move_amount = Vector2(50, 0)
			position += move_amount
		else :
			move_amount = Vector2(20, 0)
			rotation_degrees -= 2
			position += move_amount

func rotate_up():
	var move_amount = Vector2(15, 0)
	
	if rotation_degrees >= 90:
		rotation_degrees = 0
		position = Vector2(1738, 1267)
	else:
		if rotation_degrees >= 42:
			rotation_degrees += 2
			move_amount = Vector2(-50, 0)
			position += move_amount
		else :
			move_amount = Vector2(-20, 0)
			rotation_degrees += 2
			position += move_amount
