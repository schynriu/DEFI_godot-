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
			get_node("Label").text = "Lucifer escaped from hell, and with him his horde of demon and captured souls..."
		2:
			get_node("Label").text = "They came to earth!"
		3:
			get_node("Label").text = "Thou shall destroy them and bring them back to hell, that is your mission youngling."
		4:
			get_node("Label").text = "Now wake up youngling! You are already falling into the dark!"
		5:
			get_tree().change_scene("res://scene/NIVEAU/NIVEAU1.tscn")