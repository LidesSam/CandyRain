
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"
var  new_x  
var  sprite_x

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	new_x =get_pos().x
	sprite_x = get_node("Sprite").get_texture().get_width()/2
	set_process_input(true)
	set_fixed_process(true)
	connect("body_enter",self,"_on_body_enter") #activa el _on_body en cada step
	connect("body_enter_shape",self,"_on_body_enter") #activa el _on_body en cada step
	
func _on_body_enter( body ):
	#get_node("Sprite").set_frame(0)
	if (body extends preload("res://scripths/candyball.gd")):
		body.remove()
		#get_node("Sprite").set_frame(0)
		if get_parent().has_node("GUI/give"):
			get_parent().get_node("GUI").giveAdd()
			

func _fixed_process(delta):
	var px=get_pos().x
	#get_node("lbl_EVENT").set_text(str("X: ",px," new_X: ",new_x))
	if px!=  new_x:
		set_pos(Vector2(new_x,self.get_pos().y))
		#get_node("Label").set_text(String("X:",get_pos().x+" Y: "+get_pos().y))
		

func _input(event):
	
	#get_node("Label").set_text(str( "X: ",event.pos.x," Y: ",event.pos.y))
	#get_node("lbl_EVENT").set_text(str(get_viewport_rect().pos.x ,"  ", get_viewport_rect().pos.x +get_viewport_rect().pos.width))
	
	if (event.type == InputEvent.SCREEN_TOUCH or event.type == InputEvent.SCREEN_DRAG):
		new_x=event.pos.x
		
