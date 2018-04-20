extends Area2D

#var yolo = 2
var taken = false

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):

	
	var bodies = get_overlapping_bodies()
		 #se truc cree un evenement et se modifie pendants l'action ,cette variable contient tout les ''bodies '' qui rentre en contact avec
	for body in bodies: # step throu chaque body qui est dans cette liste
		if not taken and body.name == "player": #les deux egale signifie verifier, sortir vrai ou faux
			get_node("../../player/player/UI/cpt_pot").inv_pot +=1 #ceci permet de faire en sorte que la porte nous emmenera au lvl qu'on voudra, en le modifiant dans les nod  
			taken = true
			hide()
			