class_name PlayerState
extends State

@export var fall_state 			: PlayerState
@export var run_state 			: PlayerState
@export var jump_state 			: PlayerState
@export var attack_state 		: PlayerState
@export var idle_state 			: PlayerState
@export var combo_attack_state 	: PlayerState
@export var heavy_attack_state 	: PlayerState
@export var dash_state			: PlayerState
@export var crouch_state		: PlayerState

@export var jump_component 		: JumpComponent
@export var player_velocity 	: VelocityComponent
@export var player_gravity		: GravityComponent

@export var has_control			: bool
@export var sprite_offset		: Vector2 = Vector2(5.5, 0)

func enter() -> void :
	super()
	
	var direction = -1 if sprite.flip_h else 1
	
	sprite.offset.x = sprite_offset.x * direction
	sprite.offset.y = sprite_offset.y
	character.play_animation(animation_name)

func process_physics(delta:float) -> State :
	super(delta)
	
	var direction : float = InputBus.get_axis() if has_control else 0.0
	
	if direction != 0.0 : character.flip_sprite(direction)
	character.velocity.x = move_toward(character.velocity.x, player_velocity.max_velocity * direction, delta * (1000 if character.is_on_floor() else 500))
	character.velocity.y = move_toward(character.velocity.y, 1000, delta * player_gravity.gravity)
	
	player_velocity.velocity = character.velocity.x
	character.move_and_slide()
	
	handle_player_off_screen_x()
	
	return null

func handle_player_off_screen_x() -> void :
	var camera = character.get_viewport().get_camera_2d()
	var screenlimitR : float = camera.get_screen_center_position().x + character.get_viewport_rect().size.x / camera.zoom.x / 2 - 7
	var screenlimitL : float = camera.get_screen_center_position().x - character.get_viewport_rect().size.x / camera.zoom.x / 2 + 7
	character.global_position.x = clamp(character.global_position.x, screenlimitL, screenlimitR)
