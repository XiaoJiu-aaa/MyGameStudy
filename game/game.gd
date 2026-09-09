extends Node2D


var car_scene : PackedScene =preload("res://Cartscn/car.tscn")

var finalcore :int = 30
var timepass  :int = 0 

func _on_car_timer_timeout() -> void:
	var car = car_scene.instantiate() as Area2D
	var car_marker = $CarStartPosition.get_children().pick_random()
	car.position = car_marker.position
	$Objects.add_child(car)
	
	car.connect("body_entered",go_to_title)

# 返回标题
func go_to_title(_body:Node2D) ->void:
	call_deferred("changetree")
	
func _on_finalgame_body_entered(_body: Node2D) -> void:
	# 正在处理物理实体时必须使用call_deferred来确保安全
	call_deferred("changetree")
	GlobleVar.score = finalcore

func changetree():
	get_tree().change_scene_to_file("res://title/title.tscn")

func _on_core_timer_timeout() -> void:
	finalcore-=1
	timepass+=1
	$CanvasLayer/cur_core.text = "Core : %d" % finalcore
	$CanvasLayer/time.text = "Time : %d" % timepass
