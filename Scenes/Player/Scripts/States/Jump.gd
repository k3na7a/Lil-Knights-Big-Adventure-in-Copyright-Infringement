extends PlayerState

func enter() -> void :
	super()
	
	jump_component.jump()

func process_input(event:InputEvent) -> State :
	super(event)
	
	if event.is_action_pressed("Attack") : return attack_state
	return null

func process_physics(delta:float) -> State :
	super(delta)
	
	if character.velocity.y > 0 : return fall_state
	return null
