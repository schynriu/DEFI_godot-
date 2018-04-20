extends Area2D

# class member variables go here, for example:
# var a = 2
var activer = false
var timer
var button
var dialogue
var act_time = false
var discution = 1

func _ready():
	get_node("affBtn").hide()
	timer = get_node("Timer")
	timer.connect("timeout", self, "_on_Timer_timeout")
	button = get_node("../../player/UI/fenetre/Button")
	button.connect("pressed", self, "_on_Button_pressed")
	dialogue = get_node("../../player/UI/fenetre/Label")
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") :
			discution += 1
			pass
	if activer :
		match discution:
			1:
				dialogue.text = "Thou know the way to strike, thou shall know the way to destroy your foes "
				
			2:
				dialogue.text = "Remember, as big and dark your opponent can be, remember the way we thought you to strike (D/SPACE) "
				
			3:
				get_node("../../player/UI/fenetre").hide()
				dialogue.text = ""
				activer = false
		pass
	
	var bodies = get_overlapping_bodies()
		 #se truc cree un evenement et se modifie pendants l'action ,cette variable contient tout les ''bodies '' qui rentre en contact avec
	for body in bodies: # step throu chaque body qui est dans cette liste
		if body.name  == "player": #les deux egale signifie verifier, sortir vrai ou faux
				
			get_node("affBtn").show()
			timer.start()
			if Input.is_action_pressed("ui_action"):
				get_node("affBtn").hide()
				get_node("../../player/UI/fenetre").show()
				activer = true
				discution = 1
			pass 
	pass
	
func _on_Button_pressed() :
	discution += 1
	
func _on_Timer_timeout():
	get_node("affBtn").hide()