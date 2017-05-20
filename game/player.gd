extends RigidBody2D

signal points_change

# Character Properties
var acceleration = 2000
var top_move_speed = 400
var top_jump_speed = 300

# Movement Vars
var directional_force = Vector2()
const DIRECTION = {
	ZERO = Vector2(0,0),
	LEFT = Vector2(-1,0),
	RIGHT = Vector2(1,0),
	UP = Vector2(0,-1),
	DOWN = Vector2(0,1)
}

func _ready():
	print("hello")
	connect("body_enter", self, "_on_enemy_body_enter")

func _integrate_forces(state):
	var final_force = Vector2()
	
	directional_force = DIRECTION.ZERO
	
	if Input.is_action_pressed("ui_left"):
		directional_force += DIRECTION.LEFT
	if Input.is_action_pressed("ui_right"):
		directional_force += DIRECTION.RIGHT
		
	if Input.is_action_pressed("ui_up"):
		#if !state.get_linear_velocity().y:
		directional_force += DIRECTION.UP
		
	if Input.is_action_pressed("ui_select"):
		var collision_room = get_node("/root/global").collision_room
		if collision_room:
			get_node("/root/global").goto_room(collision_room.room, collision_room.location)
	
	final_force = state.get_linear_velocity() + (directional_force * acceleration)
	
	# Prevent Exceeding Top Speed
	if final_force.x < -top_move_speed:
		final_force.x = -top_move_speed
	if final_force.x > top_move_speed:
		final_force.x = top_move_speed
	
	# Prevent Exceeding Top Jump Speed
	if final_force.y < -top_jump_speed:
		final_force.y = -top_jump_speed
	if final_force.y > top_jump_speed:
		final_force.y = top_jump_speed
		
	if final_force.x < -1:
		set_scale(Vector2(-1,1))
	if final_force.x >1:
		set_scale(Vector2(1,1))
	
	state.set_linear_velocity(final_force)
	
func change_life(delta):
	print(delta)
	get_node("/root/global").life_points += delta
	emit_signal("points_change")