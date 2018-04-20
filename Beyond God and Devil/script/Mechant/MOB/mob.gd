extends Area2D

const fireball_speed = 200

func _ready():
	set_process(true)
	
	
func _process(delta):
	var speed_x = 1
	var speed_y = 0 
	var motion = Vector2(speed_x, speed_y) * fireball_speed 
	set_pos(get_pos() + motion + delta) # donne la position actuelle et ajoute le mouvement a la position actuelle + delta 