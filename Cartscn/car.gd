extends Area2D

var direction :Vector2 = Vector2.LEFT

var speed :int =400
var colors = [
	preload("res://asserts/picture/icon.svg"),
	preload("res://asserts/picture/car1.png"),
	preload("res://asserts/picture/OIP-C.webp")]


func _ready() -> void:
	if position.x < 200 :
		direction = Vector2.RIGHT
	
	var car_texture = colors.pick_random() as Texture
	if car_texture == colors[1] and direction==Vector2.RIGHT:
		$Sprite2D.flip_h = true
	elif car_texture == colors[2] and direction==Vector2.LEFT:
		$Sprite2D.flip_h = true
		
	
	var texture_size = car_texture.get_size()
	$Sprite2D.texture = car_texture
	$Sprite2D.scale = Vector2(100,55)/texture_size
	

func _process(delta: float) -> void:
	position +=direction*speed*delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
