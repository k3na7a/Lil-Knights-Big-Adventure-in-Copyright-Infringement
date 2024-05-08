class_name PauseScreen
extends Control

@export var resume_button 	: Button
@export var quit_button 	: Button

func _ready() -> void :
	hide()
	handle_connecting_signals()

func _input(event: InputEvent) -> void :
	if event.is_action_pressed("Options") : 
		pause() if not get_tree().paused else resume()

func handle_connecting_signals() -> void :
	resume_button.pressed.connect(resume)
	quit_button.pressed.connect(quit)

func pause() -> void :
	resume_button.grab_focus()
	get_tree().paused = true
	show()

func resume() -> void :
	get_tree().paused = false
	hide()

func quit() -> void : 
	get_tree().quit(0)
