class_name PlayerState
extends State

@export var fall_state 				: PlayerState
@export var run_state 				: PlayerState
@export var jump_state 				: PlayerState
@export var attack_state 			: PlayerState
@export var idle_state 				: PlayerState
@export var combo_attack_state 		: PlayerState
@export var heavy_attack_state 		: PlayerState
@export var dash_state				: PlayerState
@export var crouch_state			: PlayerState

@export var jump_component 			: JumpComponent
@export var velocity_component 		: VelocityComponent
@export var gravity_component		: GravityComponent
@export var screen_clamp_component	: ScreenClampComponent

@export var has_control				: bool
@export var sprite_offset			: Vector2 = Vector2(5.5, 0)

func enter() -> void :
	super()
	
	var direction = -1 if sprite.flip_h else 1
	
	sprite.offset = Vector2(sprite_offset.x * direction, sprite_offset.y)
	
	character.play_animation(animation_name)

func process_physics(delta:float) -> State :
	super(delta)
	
	var direction : float = InputBus.get_axis() if has_control else 0.0
	
	if direction != 0.0 : character.flip_sprite(direction)
	
	velocity_component.handle_horizontal_movement(delta, direction)
	gravity_component.apply_gravity(delta)
	
	character.move_and_slide()
	screen_clamp_component.handle_player_off_screen_x()
	
	return null
