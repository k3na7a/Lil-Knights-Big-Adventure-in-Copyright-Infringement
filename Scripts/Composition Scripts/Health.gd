class_name HealthComponent
extends Node

@export var health : float

func get_health() -> float : return health
func set_health(new_health:float) -> void : health = new_health

func damage(attack: Attack) -> void :
	health -= attack.attack_damage
	if health <= 0: get_parent().queue_free()
