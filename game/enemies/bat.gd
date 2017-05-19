extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var acceleration = 100
var max_speed = 200

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	pass
	
func _on_bat_body_enter( body ):
	if (body extends preload("res://game/player.gd")):
		print("made it")
		body.change_life(-1)
