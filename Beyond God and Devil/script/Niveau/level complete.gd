extends Area2D


export(String, FILE, "*.tscn") var world_scene# ceci cree une variable world scene, qui permet de transofner la porte en scene 

func _physics_process(delta):

	var bodies = get_overlapping_bodies()
		 #se truc cree un evenement et se modifie pendants l'action ,cette variable contient tout les ''bodies '' qui rentre en contact avec
	for body in bodies: # step throu chaque body qui est dans cette liste
		if body.name == "player": #les deux egale signifie verifier, sortir vrai ou faux
			get_tree().change_scene("res://UI/main_menu/Fin.tscn") #ceci permet de faire en sorte que la porte nous emmenera au lvl qu'on voudra, en le modifiant dans les nod  
			