
extends KinematicBody2D

const GRAVITY = 20 
const SPEED = 250
const JUMP = -625
const ACCELERATION = 50
const UP = Vector2(0, -1)
var motion = Vector2()
var atking = false
var mort = false
var jAtking = false
var inventaire
#var timer
var jumping = true
enum states {IDLE,RUN,ATTACK,DEAD}

func damage():
	print("Aie :(")#remplacer ici les dommage a mettre, mettre ici les degats de la boule de feu
	get_node("UI/MarginContainer/HPbar").cpt_vie -=10
	pass
	
	
func avancee_anim():
	# Récupère l'animation
	var anim = $animation_perso
	
	# Check si animation d'attaque.
	if (
		anim.animation == "attaque" or
		anim.animation == "attaque saut"):
		# Si la frame de l'animation est bonne.
		if (anim.frame == 5):
			# Récupère l'objet collisionnant le ray cast.
			var body = $ray.get_collider()
			print(body)
			
			# Teste le résultat.
			if ((body != null) and (body.name == "magicien" or body.name == "magicien2" or body.name == "magicien3" or body.name == "block")):#!= different de
				# Endommage le magicien.
				body.damage(self) 

func _ready():
	# Connecter la fonction d'avancée de l'animation.
	$animation_perso.connect("frame_changed", self, "avancee_anim")
	get_node("UI/fenetre").hide()
	inventaire = get_node("UI/stats/cpt_pot.gd")
	pass

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false 

	if get_node("UI/MarginContainer/HPbar").cpt_vie == 0 and not mort:
		$animation_perso.play("mort")
		mort = true
#		timer.start()
	pass
	
	if not atking and not mort:
#		if Input.is_action_pressed("ui_soin") :
#			if inventaire.inv_pot > 0 :
#				inventaire.inv_pot -=1
#				get_node("UI/MarginContainer/HPbar").cpt_vie +=30
#				pass
#			pass
			
		if Input.is_action_pressed("ui_right"):
	
			motion.x = min(motion.x+ACCELERATION, SPEED) # motion min sert a a ''utiliser'' la plus petite des valeur, c'est pour eviter que l'acceleration ne depasse la vitesse normale, c'est genre un IF
			
		elif Input.is_action_pressed("ui_left"):
			motion.x = max(motion.x -ACCELERATION, -SPEED)
			
		else:
			motion.x = 0
			friction = true  
			motion.x = lerp(motion.x, 0, 0.2) # ralenti de 20 % chaque frame du jeu, ce qui reduis les ''friction'' du jeu
	
		if is_on_floor():
			jAtking = false 
			jumping = false
			if Input.is_action_just_pressed("ui_up"):
				motion.y = JUMP
			if friction == true: 
				motion.x = lerp(motion.x, 0, 0.2)
			
			if motion.x != 0:
				if motion.x <0:
					
					$animation_perso.flip_h = true
					$animation_perso.play("marche")
					$ray.cast_to.x = -45
					
					
				if motion.x >0:
					
					$animation_perso.flip_h = false
					$animation_perso.play("marche")
					$ray.cast_to.x = 45
			elif not atking:
				 $animation_perso.play("pas_bouger")
		
		else:
			jumping = true
			if not jAtking : 
				if motion.y < 0:
					$animation_perso.play("saut")
				else:
					$animation_perso.play("tombe")
				if friction == true: 
					motion.x = lerp(motion.x, 0, 0.05)# avoir encore moin de friction en l'air que d'ordinaire
					
				if motion.x !=0:
					if motion.x <0:
						$animation_perso.flip_h = true
						
					if motion.x >0:
						$animation_perso.flip_h = false
				pass
			
					
		motion = move_and_slide(motion, UP)
	
	#-------------<animation d'attaque>-------------
	if Input.is_action_pressed("attaque") and not atking and not jumping:
		atking = true
		$animation_perso.play("attaque")
		pass

	if $animation_perso.animation == "attaque" and $animation_perso.frame == 8 : 
		atking = false 
		pass

	if $animation_perso.animation == "mort" and $animation_perso.frame == 19 : 
		mort = false
		get_node("UI/MarginContainer/HPbar").cpt_vie = get_node("UI/MarginContainer/HPbar").max_value
#		position = get_node("../../spawner_level").position
		get_tree().change_scene("res://UI/main_menu/GameOver.tscn")
		pass

	if Input.is_action_pressed("attaque") and jumping :
		jAtking = true
		$animation_perso.play("attaque saut")
		pass

	if $animation_perso.animation == "attaque saut" and $animation_perso.frame == 9 : 
		jAtking = false 
		pass

#func _on_Timer_timeout():
#	mort = false
#	position = get_node("../../spawner_level").position
#	pass

#func _input():
#	if .is_action_pressed("attaque"):
#		$animation_perso.play("attaque")

	#-------------</animation d'attaque>-------------

 	#if animation_perso.play("attaque"):
	#		$coli_attaque=true
	#else:
	#	$coli_attaque=false   
#func change_state(new_state):#clean up the previous state 
#	match state:

	
		