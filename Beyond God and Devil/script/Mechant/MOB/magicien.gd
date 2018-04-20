extends Area2D

#
#
#
#get sceen 

# Vie du magicien
var vie = 2

# Mouvement du magicien.
var mouvement = Vector2()
# Timer du magicien.
var timer = 0

# Classe de la bouboulle.
var fireball_class = preload("res://scene/mob/fireball.tscn")
# Cooldown de tir.
var cooldown = 0

func damage(donnor):
	# Prendre un dommage.
	vie -= 1 # Enlève 1 à la variable vie.
	
	# Si l'on a plus de vie.
	if (vie == 0):
		# Détruit le magicien.
		queue_free()
#	else:
#		# On récupère le vecteur magicien <-> joueur.
#		var magPlayer = donnor.position - position
#		# On inverse ce vecteur.
#		magPlayer = -magPlayer
#		# On fait reculer le magicien.
#		mouvement += magPlayer

func _physics_process(delta):#process qui s'appelle a chaque frame
	# Incrémente le timer.
	timer += delta
	
	# Gestion de la barre de vie d'un magicien.
	get_node("Hp").value = vie
	
	# Calcule le mouvement du magicien.
	if (timer < 2):
		# Se deplace vers la gauche.
		mouvement.x = -100
		# Dirige le raycast vers la gauche.
		$ray.cast_to.x = -320
		# Flip le magicien.
		$Sprite.flip_h = false
	else:
		# Se deplace vers la droite.
		mouvement.x = 100
		# Dirige le raycast vers la droite.
		$ray.cast_to.x = 320
		# Flip le magicien.
		$Sprite.flip_h = true
		
		# Si le timer a dépassé 4.
		if (timer > 4):
			# On le repasse à 0.
			timer = 0
	
	# Si le cooldown est à 0.
	if (cooldown <= 0):
		# Si le raycast touche le joueur.
		var body = $ray.get_collider()
		if (($ray.is_colliding()) and (body.name == "player")):
			# Instancie une nouvelle boulle de feu.
			var bouboule = fireball_class.instance()
			# Attache la boule au monde.
			get_tree().get_root().add_child(bouboule)
			#Défini la position de la boule.
			bouboule.position = position
			# Défini la direction de la boule.
			if (mouvement.x < 0):
				bouboule.direction = -1
			else:
				bouboule.direction = 1
			
			# Assigne la valeur du cooldown.
			cooldown = 0.65
	else:
		# Fait descendre le cooldown.
		cooldown -= delta
	
	# Déplace le magicien.
	position += mouvement * delta