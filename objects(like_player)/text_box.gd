extends CanvasLayer

@onready var text = $Label
var text_to_say = ["Alright, dear"," let’s get started with making our lasagna."," First things first, let’s get our ingredients ready.",
"For the pasta:","1:Put in flour","2:Put in eggs.","3:Put in water.","4:Now right click to mix it all together, nice and smooth.",
"Great sweetheart.","For the sauce:"]
var txt2say_index = 0
func _ready():
	text.text = text_to_say[txt2say_index]
	var tween = get_tree().create_tween()
	
	
	$Label.visible_ratio = 0
	tween.tween_property($Label,"visible_ratio", 1, 1)


func _on_margin_container_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		$AudioStreamPlayer.play()
		var tween = create_tween()
		print(txt2say_index)
		txt2say_index+=1
		$Label.visible_ratio = 0
		text.text = text_to_say[txt2say_index]
		tween.tween_property(text,"visible_ratio", 1, 2)
		if tween.finished:
			$AudioStreamPlayer.stop()
		
	


