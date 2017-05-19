extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var room = ""
export var location = ""

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	print(room)
	pass

func _on_shifter_body_enter( body ):
	print(body)
	if (body extends preload("res://game/player.gd")):
		get_node("/root/global").collision_room = self
		


func _on_door_body_enter( body ):
	_on_shifter_body_enter(body)
