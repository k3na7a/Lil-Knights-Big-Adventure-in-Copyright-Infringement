class_name PlayerState
extends State

@export_group("State Variables")
@export var animation_name	: String
@export var has_control		: bool
@export var sprite_offset	: Vector2 = Vector2(5.5, 0)

func enter() -> void :
	super()
	
	var direction = -1 if character.sprite.flip_h else 1
	
	character.sprite.offset = Vector2(sprite_offset.x * direction, sprite_offset.y)
	character.sprite.play_animation(animation_name)

func process_physics(delta:float) -> State :
	super(delta)
	
	var direction : float = character.input_bus.get_axis() if has_control else 0.0
	if direction != 0.0 : character.sprite.flip_sprite(direction)
	
	character.jump_node.handle_coyote_time(character)
	character.movement_node.handle_horizontal_movement(character, direction, delta)
	character.gravity_node.apply_gravity(character, delta)
	
	character.move_and_slide()
	
	return null
