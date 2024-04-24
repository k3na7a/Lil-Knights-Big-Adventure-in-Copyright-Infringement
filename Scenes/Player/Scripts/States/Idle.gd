extends PlayerState

func process_input(event:InputEvent) -> State :
	super(event)
	
	if event.is_action_pressed("Jump") 		: return jump_state
	elif event.is_action_pressed("Attack") 	: return attack_state
	elif event.is_action_pressed("Action")	: return dash_state
	return null

func process_physics(delta:float) -> State :
	super(delta)
	
	if !character.is_on_floor() 		: return fall_state
	elif InputBus.get_axis() != 0.0 	: return run_state
	elif InputBus.input_down == 1.0		: return crouch_state
	return null
