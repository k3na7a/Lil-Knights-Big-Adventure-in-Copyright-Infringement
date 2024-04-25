class_name VelocityComponent
extends Node

@export var character		: CharacterBody2D

@export var max_velocity 	: float
@export var velocity 		: float :
	set(value) : velocity = value
	get : return velocity
@export var ground_friction : float :
	set(value) : ground_friction = value
	get : return ground_friction
@export var air_friction : float :
	set(value) : air_friction = value
	get : return air_friction

func reset() -> void : velocity = max_velocity

func handle_horizontal_movement(delta:float,direction:float) -> void :
	var _delta = delta * (ground_friction if character.is_on_floor() else air_friction)
	var _speed = max_velocity * sign(direction)
	
	character.velocity.x = move_toward(character.velocity.x, _speed, _delta)
	velocity = character.velocity.x
