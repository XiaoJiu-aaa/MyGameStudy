extends Node2D


var car_scene : PackedScene =preload("res://Cartscn/car.tscn")



func _on_car_timer_timeout() -> void:
	var car = car_scene.instantiate() as Area2D
	var car_marker = $CarStartPosition.get_children().pick_random()
	car.position = car_marker.position
	$Objects.add_child(car)
	
	car.connect("body_entered",go_to_title)

	
func go_to_title(body:Node2D) ->void:
	print("发生碰撞")
	


func _on_final_body_entered(body: Node2D) -> void:
	print("到达终点")
