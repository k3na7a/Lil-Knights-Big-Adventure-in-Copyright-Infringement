extends PlayerState

var attack_complete : bool
var combo_attack 	: bool
var triple_attack	: bool

func enter() -> void :
	super()
	
	var direction = -1 if sprite.flip_h else 1

	character.velocity.x 	+= 100 * direction
	attack_complete 		= false
	combo_attack 			= false

func process_input(event:InputEvent) -> State :
	super(event)
	
	if Input.is_action_just_pressed("Attack") : combo_attack = true
	return null

func process_physics(delta:float) -> State :
	super(delta)
	
	if attack_complete :
		if not character.is_on_floor() 	: return fall_state
		elif combo_attack 				: return combo_attack_state
		else 							: return idle_state if InputBus.get_axis() == 0.0 else run_state
	return null

func _on_player_animation_complete(anim_name:String) -> void  : 
	if anim_name == animation_name : attack_complete = true
