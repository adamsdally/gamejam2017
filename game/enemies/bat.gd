extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var acceleration = 100
var max_speed = 200

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	pass
	
func _integrate_forces(state):
	var final_force = Vector2()
	
	var directional_force = Vector2(-1,0)
	
	final_force = state.get_linear_velocity() + (directional_force * acceleration)
	
	
	state.set_linear_velocity(final_force)
