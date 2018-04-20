extends Area2D

# class member variables go here, for example:
# var a = 2
var activer = false 
var timer
var act_time = false

func _ready():
	get_node("activer").hide()
	get_node("affBtn").hide()
	timer = get_node("Timer")
	timer.connect("timeout", self, "_on_Timer_timeout")
	pass

func _process(delta):
	var bodies = get_overlapping_bodies()
		 #se truc cree un evenement et se modifie pendants l'action ,cette variable contient tout les ''bodies '' qui rentre en contact avec
	for body in bodies: # step throu chaque body qui est dans cette liste
		if body.name  == "player": #les deux egale signifie verifier, sortir vrai ou faux
#			if not act_time :
#				act_time = true
				
			if not activer :
				get_node("affBtn").show()
				timer.start()
				if Input.is_action_pressed("ui_action"):
					get_node("desactiver").hide()
					get_node("activer").show()
					get_node("../grille").queue_free()
					activer = true
					get_node("affBtn").hide()
				pass 
	pass
	
#	if act_time : 
#		timer.start()
#		act_time = false
	
func _on_Timer_timeout():
	get_node("affBtn").hide()