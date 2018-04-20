extends Label

var inv_pot = 0
var format_string = "Potions : %d"
var actual_string

func _ready():
	pass

func _process(delta):
	actual_string = format_string % [inv_pot]
	text = actual_string
	
	if Input.is_action_just_pressed("ui_soin") :
		if inv_pot > 0 :
			inv_pot -=1
			get_node("../MarginContainer/HPbar").cpt_vie +=30
			pass
		pass
	pass

