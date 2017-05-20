extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var acceleration = 200
var top_move_speed = 200

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func _integrate_forces(state):
	var final_force = state.get_linear_velocity() + (Vector2(-1,0) * acceleration)
	
	# Prevent Exceeding Top Speed
	if final_force.x < -top_move_speed:
		final_force.x = -top_move_speed
	if final_force.x > top_move_speed:
		final_force.x = top_move_speed
	
	state.set_linear_velocity(final_force)
