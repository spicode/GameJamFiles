extends CanvasLayer


@onready var text = $Label
var speed = 2
var text_to_say = ["Alright, dear"," let’s get started with making our lasagna."," First things first, let’s get our ingredients ready.",
"For the pasta:","1:Put in flour","2:Put in eggs.","3:Put in water.","4:Now right click to mix it all together, nice and smooth.",
"Great sweetheart.","For the sauce:","1:Put in concentrated tomato sauce.","2:Put in olive oil.","3:Put in parsley.","4:Put in garlic."
,"5:Put in an onion.","6:Put in a tomato.","7:Put in my mixed seasoning.","8:Now mix it all up well.","Wonderful, now we can start on the lasagna. Bring out the tray, honey."
,"Assembling the lasagna:","1:Put a layer of lasagna sheets.","2:Add a layer of the tomato sauce we made earlier.","3:Add a layer of cheese.","4:Add some carrots."
,"5:Add mushrooms.","6:Add spinach.","7:Add peas.","8:Add an onion.","9:Put another layer of lasagna sheets."
,"10:Add another layer of tomato sauce.","11:Add a layer of cheese.","12:Add some more carrots.","13:Add mushrooms.",
"14:Add spinach.","15:Add peas.","16:Add an onion.","17:And finally, add a generous layer of cheese on top.","",""]
var txt2say_index = 0
func _ready():
	text.text = text_to_say[txt2say_index]
	var tween = get_tree().create_tween()
	$Label.visible_ratio = 0
	tween.tween_property($Label,"visible_ratio", 1, 1)
	$Open.visible = false


	

func _process(delta):
	if text_to_say[txt2say_index+1].length() < 20:
		speed = 0.5
	else:
		speed = 3
		




func _on_margin_container_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and text_to_say.size() >= txt2say_index:
		$AudioStreamPlayer.play()
		var tween = create_tween()
		txt2say_index+=1
		$Label.visible_ratio = 0
		text.text = text_to_say[txt2say_index]
		tween.tween_property(text,"visible_ratio", 1, speed)
		
		if tween.finished:
			$AudioStreamPlayer.stop()
		


func _on_open_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$Open.visible = false
		$MarginContainer.visible = true
		$Label.visible = true
		$Sprite2D.visible = true
		

func _on_close_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$Open.visible = true
		$MarginContainer.visible = false
		$Label.visible = false
		$Sprite2D.visible = false
