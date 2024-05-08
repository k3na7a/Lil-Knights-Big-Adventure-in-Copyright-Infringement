extends Node

@export var player : CharacterBody2D

func _ready() -> void :
	player.health_node.health = player.health_node.max_health

func _process(_delta:float) -> void :
	var camera = get_viewport().get_camera_2d()
	
	var screenlimitR : float = camera.get_screen_center_position().x + player.get_viewport_rect().size.x / camera.zoom.x / 2 - 7
	var screenlimitL : float = camera.get_screen_center_position().x - player.get_viewport_rect().size.x / camera.zoom.x / 2 + 7
	
	player.global_position.x = clamp(player.global_position.x, screenlimitL, screenlimitR)
	
	if player.global_position.y > get_viewport().get_camera_2d().limit_bottom + 100 : get_tree().reload_current_scene()
