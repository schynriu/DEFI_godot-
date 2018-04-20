extends TextureProgress

var cpt_vie = 100
var format_string = "%d HP / %d HP"
var actual_string

func _ready():
	pass

func _process(delta):
	set_value(cpt_vie)
	actual_string = format_string % [cpt_vie, 100]
	if cpt_vie > max_value :
		cpt_vie = max_value
		pass
	if cpt_vie <= min_value :
		get_node("Label").text = "Mort..."
		cpt_vie = min_value
		pass
	else : 
		get_node("Label").text = actual_string
		pass
	pass
