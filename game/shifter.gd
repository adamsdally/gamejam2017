extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var room = ""
export var location = ""

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_shifter_body_enter( body ):
	if (body extends preload("res://game/player.gd")):
		get_node("/root").print_tree()
		get_node("/root/global").goto_room(room, location)
