extends AnimatedSprite2D

var mouse_offset = Vector2(0,0) 
var delay = .2
var drop_spots

func _ready():
	$".".frame = 0

func get_bounding_rect() -> Rect2:
	var current_frame: int = get_frame()
	var current_animation: String = animation
	var sprite_frames: SpriteFrames

	if sprite_frames and sprite_frames.has_animation(current_animation):
		var texture: Texture2D = sprite_frames.get_frame(current_animation, current_frame)

		if texture:
			var size: Vector2 = texture.get_size()
			var offset: Vector2 = Vector2.ZERO

			if flip_h:
				offset.x = -size.x
			if flip_v:
				offset.y = -size.y
				return Rect2(offset * scale, size * scale)
	return Rect2()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
		if event.pressed:
			if Rect2().has_point(to_local(event.position)):
				print(Global.is_Mixing)
				Global.is_Mixing = true
			else:
				Global.is_Mixing = false
				mouse_offset = get_global_mouse_position()-position
		else:
			Global.is_Mixing = false
		
func is_point_in_sprite(point:Vector2,sprite) -> bool:
	var texture = sprite.texture
	var rect = Rect2(Vector2.ZERO, texture.get_size())
	return rect.has_point(point)
