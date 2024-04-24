extends PlayerState

var attack_complete : float
var attack_buffer	: bool
var combo_attack	: bool = false

func enter() -> void :
	super()
	
	attack_complete = false

func exit() -> void :
	super()
	
	combo_attack 	= false
	attack_buffer 	= false

func process_input(event:InputEvent) -> State :
	super(event)
	
	if Input.is_action_just_pressed("Attack") : attack_buffer = true
	return null

func process_physics(delta:float) -> State :
	super(delta)
	
	if attack_complete :
		if not character.is_on_floor() 		: return fall_state
		elif combo_attack or attack_buffer 	: return heavy_attack_state
		else 								: return idle_state				if InputBus.get_axis() == 0.0 else run_state
	return null

func _on_character_animation_complete(anim_name:String) -> void  : if anim_name == animation_name : attack_complete = true
