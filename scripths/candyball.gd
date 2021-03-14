
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	name = "candy";
	pass
	
func _process(delta):
	
	if (position.y+64 > get_viewport_rect().size.y):
		if get_parent().has_node("GUI"):
			get_parent().get_node("GUI").lossAdd()
		remove()
	

func remove():
	
	get_parent().remove_child(self)
	
