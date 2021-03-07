

extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"
var candy = preload("res://scene/candyball.tscn")
var coulddown
export var time = 0.0  # tiempo entre cada instaciacion
export var width = 0 # ancho de creacion
export var ajustScreen = false
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	coulddown=0.0
	
	width=get_node("Shape").get_viewport_rect().size.width-32
	
	
	set_fixed_process(true)

func _fixed_process(delta):
	
	randomize()
	if(coulddown<=0.0):
		var c = candy.instance()
		var r = int(width/ 10)
		var rx = (randi()%10)*r		
		var newX = int(get_pos().x-width/2+rx+16)
		#var string = str(newX," r-. ",rx)
		#get_parent().get_node("Label").set_text(string)
		var cpos = Vector2(newX,get_pos().y)
		#get_node("Label").set_text(str( cpos.x," newx: ",newX))
		c.set_pos(cpos)
		get_parent().add_child(c)
		
		coulddown=time #resetea coulddown
	else:
		coulddown-=delta
	#quita el objeto al  salir de la pantalla
	
