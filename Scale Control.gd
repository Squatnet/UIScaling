extends Control
var base 
var current


func _ready():
	base = get_tree().root.content_scale_size
	current = get_tree().root.content_scale_size
	get_tree().root.content_scale_mode = Window.CONTENT_SCALE_MODE_CANVAS_ITEMS 
		
func set_base_size(): # What you think you need to do, however doing this scales the WINDOW SIZE

	var tmp = Vector2i(int(current.x*$Panel/Width.value),int(current.y*$Panel/Height.value))
	get_tree().root.content_scale_size = tmp
	current = tmp
func set_by_multiplier(): # What you actually need to do, as this will multiply the canvasitems (2d) by some value)
	get_tree().root.content_scale_factor = $Panel/Multiplier.value

func _on_button_pressed():
	set_base_size()
	$Panel/Label.text = str(current)
	

func _on_button_2_pressed():
	set_by_multiplier()
	$Panel/Label.text = str(current)

	


func _on_width_drag_ended(value_changed):
	$Panel/W.text = str($Panel/Width.value)



func _on_height_drag_ended(value_changed):
	$Panel/H.text = str($Panel/Height.value)


func _on_multiplier_drag_ended(value_changed):
	$Panel/M.text = str($Panel/Multiplier.value)
