extends Node2D
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export(Texture) var icon
export var spacing=32

func _ready():
	print("Hello?")
	var player = get_node("/root")
	player.print_tree()
	get_node("/root/Node2D/player").connect("points_change", self, "_on_points_change")

func _draw():
	var life_points = get_node("/root/global").life_points
	print(life_points)
	var pos = Vector2(0,0)
	print(pos)
	for i in range(life_points):
		pos.x += spacing
		draw_texture(icon, pos, Color(1,1,1,1))
		
func _on_points_change():
	update()