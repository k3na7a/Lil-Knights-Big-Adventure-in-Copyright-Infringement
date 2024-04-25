extends PlayerState

#@export var dash_speed : float

var attack_complete : bool
var direction : int

func enter() -> void :
	super()
		
	direction = -1 if sprite.flip_h else 1
	attack_complete = false
	
	character.velocity.x += 150 * direction 

func process_physics(delta:float) -> State :
	super(delta)
	
	if attack_complete :
		if !character.is_on_floor() : return fall_state
		else : return idle_state if InputBus.get_axis() == 0.0 else run_state
	return null

func _on_player_animation_complete(anim_name:String) -> void  : 
	if anim_name == animation_name : attack_complete = true
