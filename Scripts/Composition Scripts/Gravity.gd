class_name GravityComponent
extends Node

@export var character 		: Entity

@export var base_gravity 	: int = ProjectSettings.get_setting("physics/2d/default_gravity") 
@onready var gravity 		: int = base_gravity :
	set(value) : gravity = value
	get : return gravity

func is_on_floor() 		-> bool : return character.is_on_floor()
func is_falling() 		-> bool : return character.velocity.y > 0.0 and not character.is_on_floor()
func is_on_ceiling()	-> bool : return character.is_on_ceiling()

func apply_gravity(delta:float) -> void :
	character.velocity.y = move_toward(character.velocity.y, 1000, delta * gravity)
