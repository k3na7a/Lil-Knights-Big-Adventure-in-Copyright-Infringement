extends PlayerState

var attack_complete = false

@export var dash_speed : int

func enter() -> void :
	super()
	
	attack_complete = false

func exit() -> void :
	super()
	
	velocity_component.reset()

func process_input(event:InputEvent) -> State :
	super(event)
	
	if event.is_action_pressed("Jump") 		: return jump_state
	elif event.is_action_pressed("Attack") 	: return heavy_attack_state
	return null

func process_physics(_delta:float) -> State :
	var direction = -1 if sprite.flip_h else 1
	
	character.velocity.x = velocity_component.velocity * direction
	character.move_and_slide()
	
	screen_clamp_component.handle_player_off_screen_x()
	
	if attack_complete:
		if not character.is_on_floor() : return fall_state
		else : return idle_state if InputBus.get_axis() == 0.0 else run_state 
	return null

func _on_player_animation_complete(anim_name:String) -> void  : 
	if anim_name == animation_name : attack_complete = true
