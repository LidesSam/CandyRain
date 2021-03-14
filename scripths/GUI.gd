
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

var gcount = 0
var lcount = 0
var lbl_give  
var lbl_loss 
	
	
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	lbl_give = get_node("give")  
	lbl_loss = get_node("loss")
	AjustToScreen()

func AjustToScreen():
	

	lbl_give.set_text("give")
	lbl_loss.set_text("loss")
	
func giveAdd():
	gcount+=1
	lbl_give.set_text(str(gcount))

func lossAdd():
	lcount+=1
	lbl_loss.set_text(str(lcount))
	
