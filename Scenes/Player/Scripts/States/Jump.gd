extends PlayerState

var base_gravity : float
var jump_impeded : bool

func enter() -> void :
	super()
	
	jump_impeded = false
	base_gravity = character.gravity_node.gravity
	
	character.gravity_node.gravity = character.jump_node.jump_gravity
	character.jump_node.handle_jump(character)

func exit() -> void :
	super()
	
	character.gravity_node.gravity = base_gravity

func process_input(event:InputEvent) -> State :
	super(event)
	
	if event.is_action_pressed("Attack") 	: return state_machine.states["attack"]
	return null

func process_physics(delta:float) -> State :
	super(delta)
	
	handle_impede_jump()
	
	if character.velocity.y > 0 : return state_machine.states["fall"]
	return null

func handle_impede_jump() -> void :
	if not character.input_bus.input_jump and not jump_impeded : 
		jump_impeded = true
		
		character.velocity.y *= 0.5
		character.gravity_node.gravity = base_gravity
