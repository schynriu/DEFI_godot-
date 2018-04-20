extends TextureRect

var discution = 1

func _ready():
	get_node("Button").connect("pressed", self, "_on_button_pressed")
	pass

func _on_button_pressed():
	discution += 1
	pass
	


func _process(delta):
	if Input.is_action_just_pressed("ui_accept") :
		discution += 1
		pass
	match discution:
		1:
			get_node("Label").text = "Crédit : DIETSCHIN Valentin et MATHIEU Tristan."
		2:
			get_node("Label").text = "Remerciments spécial à JB pour le débloquage."
		3:
			get_node("Label").text = " Ainsi qu'à Armelle pour le sprite du magicien."
		4:
			get_tree().change_scene("res://UI/main_menu/Main_Menu.tscn")