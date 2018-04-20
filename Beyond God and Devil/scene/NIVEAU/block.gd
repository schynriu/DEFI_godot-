extends StaticBody2D


# class member variables go here, for example:
var vie = 1
# var b = "textvar"

func damage(donnor):
	# Prendre un dommage.
	vie -= 1 # Enlève 1 à la variable vie.
	
	# Si l'on a plus de vie.
	if (vie == 0):
		# Détruit le magicien.
		queue_free()
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
