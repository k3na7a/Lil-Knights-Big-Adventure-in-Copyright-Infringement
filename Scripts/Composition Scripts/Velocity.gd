class_name VelocityComponent
extends Node

@export var max_velocity 	: float
@export var velocity 		: float :
	set(value) : velocity = value
	get : return velocity

func reset() -> void : velocity = max_velocity
