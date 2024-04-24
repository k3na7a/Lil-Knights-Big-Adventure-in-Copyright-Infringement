extends PlayerState

@export var timer : Timer

func process_input(event:InputEvent) -> State :
	super(event)
	
	if Input.is_action_just_pressed("Jump") 	: timer.start()
	elif event.is_action_pressed("Attack") 		: return attack_state
	return null

func process_physics(delta:float) -> State :
	super(delta)
	
	if character.is_on_floor() and timer.time_left > 0.0 	: return jump_state
	elif character.is_on_floor() 							: return idle_state if InputBus.get_axis() == 0 else run_state
	return null
