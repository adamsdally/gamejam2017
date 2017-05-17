extends Node

var current_scene = null

func _ready():
        var root = get_tree().get_root()
        current_scene = root.get_child( root.get_child_count() -1 )
	
func goto_room(room, location):
	call_deferred("_deferred_goto_room", room, location)

func _deferred_goto_room(room, location):
	
	# Immediately free the current scene,
	# there is no risk here.
	current_scene.free()
	
	# Load new scene
	var s = ResourceLoader.load("res://game/rooms/"+room+".tscn")
	
	# Instance the new scene
	current_scene = s.instance()
	
	# Add it to the active scene, as child of root
	get_tree().get_root().add_child(current_scene)
	print(location)
	var startpos = current_scene.get_node(location).get_pos()
	current_scene.print_tree()
	print(startpos)
	var player_resource = preload("player.tscn")
	var player = player_resource.instance()
	player.set_pos(startpos)
	current_scene.add_child(player)

	# optional, to make it compatible with the SceneTree.change_scene() API
	get_tree().set_current_scene( current_scene )