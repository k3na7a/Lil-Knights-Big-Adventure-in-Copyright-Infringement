class_name StateMachineComponent
extends Node

@export var starting_state: State
var current_state: State

func change_state(new_state:State) -> void :
	if current_state: current_state.exit()
	current_state = new_state
	current_state.enter()

func init() -> void : change_state(starting_state)

func physics_process(delta:float) -> void :
	var new_state = current_state.process_physics(delta)
	if new_state: change_state(new_state)

func unhandled_input(event:InputEvent) -> void :
	var new_state = current_state.process_input(event)
	if new_state: change_state(new_state)

func process(delta:float) -> void :
	var new_state = current_state.update(delta)
	if new_state: change_state(new_state)
