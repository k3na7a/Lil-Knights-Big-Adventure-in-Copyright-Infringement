extends State

@export var goomba					: Goomba
@export var move_character			: MoveCharacterComponent
@export var bi_directional_raycast 	: BiDirectionalRaycastComponent

func enter() -> void:
	move_character.set_speed(move_character.move_speed)
	super()

func update(delta:float) -> State :
	var is_colliding 		: int = bi_directional_raycast.is_colliding()
	if is_colliding != 0	: move_character.set_direction(-is_colliding)
	return super(delta)
