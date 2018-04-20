extends Area2D

var touche = false

func _ready():
	
	pass

#($StartPosition.position)

func _process(delta):
	var bodies = get_overlapping_bodies()
		 #se truc cree un evenement et se modifie pendants l'action ,cette variable contient tout les ''bodies '' qui rentre en contact avec
	for body in bodies: # step throu chaque body qui est dans cette liste
		if not touche and body.name == "player": #les deux egale signifie verifier, sortir vrai ou faux
			get_node("../../../../../player/player/UI/MarginContainer/HPbar").cpt_vie -=10 #ceci permet de faire en sorte que la porte nous emmenera au lvl qu'on voudra, en le modifiant dans les nod  
			#get_node("../immigration/player").position = Vector2(151, 478)
			#get_node("../immigration/player").position = get_node("../respawn").position
			get_node("../../../../../player/player").position = get_node("../respawn").position
			touche = true