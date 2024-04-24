class_name Input_Bus
extends Node

@export_group('Directions')
@export var input_right		: float = 0.0
@export var input_left		: float = 0.0
@export var input_up		: float = 0.0
@export var input_down		: float = 0.0
@export_group('Actions')
@export var input_jump		: bool = false
@export var input_action	: bool = false
@export var input_attack	: bool = false

func _unhandled_input(event:InputEvent) -> void:
	if(event.is_action("Right")):
		input_right 	= Input.get_action_strength("Right")
	elif(event.is_action("Left")):
		input_left 		= Input.get_action_strength("Left")
	elif(event.is_action("Up")):
		input_up 		= Input.get_action_strength("Up")
	elif(event.is_action("Down")):
		input_down 		= Input.get_action_strength("Down")
	elif(event.is_action("Jump")):
		input_jump 		= Input.is_action_pressed("Jump")
	elif(event.is_action("Action")):
		input_action	= Input.is_action_pressed("Action")
	elif(event.is_action("Attack")):
		input_attack	= Input.is_action_pressed("Attack")

# return -1 if left held elif 1 if right held else 0
func get_axis() -> float:
	return input_right - input_left
