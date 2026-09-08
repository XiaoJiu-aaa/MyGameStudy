extends CharacterBody2D

var direction: Vector2
var speed:int=200

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("LeftMove","RightMove","UpMove","DownMove")
	velocity = direction*speed
	move_and_slide()
