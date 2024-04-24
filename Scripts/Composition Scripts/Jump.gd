class_name JumpComponent
extends Node

@export var character			: Entity

@export var base_jump_force 	: int
@onready var jump_force : int = base_jump_force :
	set(value) : jump_force = value
	get : return jump_force

func jump() -> void : character.velocity.y = -jump_force
