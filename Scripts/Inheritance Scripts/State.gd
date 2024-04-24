class_name State
extends Node

var entity 		: Entity
var states 		: Dictionary = {}

@export var state_machine		: StateMachineComponent

@export var animation_player	: AnimationPlayer
@export var sprite				: Sprite2D
@export var character			: CharacterBody2D

@export var animation_name	: String

func enter() 	-> void: pass
func exit() 	-> void: pass

func update(_delta:float)				-> State: return null
func process_input(_event: InputEvent) 	-> State: return null
func process_physics(_delta: float) 	-> State: return null
