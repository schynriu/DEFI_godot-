#extends CollisionShape2D
#
#
#
#func _process(delta):
#	var collision 
#	var bodies = get_overlapping_bodies()
#		 #se truc cree un evenement et se modifie pendants l'action ,cette variable contient tout les ''bodies '' qui rentre en contact avec
#	for body in bodies:# step throu chaque body qui est dans cette liste
#		if body.name == "player":
#			body.pv = -10 
#
#		else motion.x = min(motion.x+ACCELERATION, SPEED):
	#utiliser la motion pour deplacer sans arret la balle ( voir plus haut ) pour faire qu'elle bouge tant qu'elle est pas en contact avec player ou obstacle 
	
	
	#
	#pass

#addforce(vector2   #ajouter un vecteur2 x,y  






extends Area2D


var motion = Vector2(200,0)
var direction = 1
var player_class = preload("res://scene/player/player.tscn")
#var bodies = get_overlapping_bodies()

func _ready():
	connect("body_entered", self, "collision")
#connect sert a lire un signal avec une ''methode ( fonction)''  

# Déclenchée quand une collision a lieu avec un autre objet. 
func collision(body):  
	# Si l'objet est un player.
	if (body.name == "player"):
		# On endommage le joueur.
		body.damage();
		queue_free()#la foncion qui gere les dommage est dans le player, 
	if body.get_parent().name == "walls" :
		queue_free()# sa detruit la bouboule a la fin de la frame 
		pass

func _process(delta):
	
	# Récupère le vecteur de vitesse.
	var mouvement = motion
	# Fait correspondre la vitesse à la direction.
	mouvement.x *= direction

	position += mouvement * delta;
	
	$animation_bouboule.play("bouboule")
	

	if mouvement.x != 0:
			if mouvement.x <0 :
				
				$animation_bouboule.flip_h = false
				$animation_bouboule.play("bouboule")
				
			if mouvement.x >0 :
				
				$animation_bouboule.flip_h = true
				$animation_bouboule.play("bouboule")
				
				
			#for body in bodies:# step throu chaque body qui est dans cette liste
			#	if body.name == "player":
			#			get_node("../../../player/player/UI/MarginContainer/HPbar").cpt_vie -=20
