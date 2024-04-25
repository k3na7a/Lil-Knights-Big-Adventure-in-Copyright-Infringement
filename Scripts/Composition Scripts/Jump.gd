class_name JumpComponent
extends Node

@export var character			: Entity

@export var jump_force : int :
	set(value) : jump_force = value
	get : return jump_force

func handle_jump() -> void : character.velocity.y = -jump_force
