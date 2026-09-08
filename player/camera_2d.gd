extends Camera2D


func _physics_process(_delta: float) -> void:
	if Input.is_action_just_released("Camesizeplus"):
		zoom+=Vector2(0.2,0.2)	
	if Input.is_action_just_pressed("Camesizedrec"):
		zoom+=Vector2(-0.2,-0.2)
