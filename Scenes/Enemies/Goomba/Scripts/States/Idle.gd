extends State

@export var move_character : MoveCharacterComponent

func enter() -> void : 
	move_character.set_speed(0)
	super()
