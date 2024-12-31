extends CharacterBody2D
var speed = 250
var  jump = 300
var  grftie = 12
var left_jump = 0
var  max_jump = 2
var bullt_timer: Timer
var wall_jump = 100

func _physics_process(delta):


	move_and_slide()
	move()
	jumps()
	attack()


func move():
	
	if is_on_floor():
		left_jump = max_jump

	if Input.is_action_pressed("left"):
		velocity.x = -speed 
		$sperit/Sprite2D.scale.x = -1
	
	elif Input.is_action_pressed("ritgh"):
		velocity.x = speed 
		$sperit/Sprite2D.scale.x = 1
	else :
		velocity.x = 0

	if not is_on_floor():
		velocity.y += grftie

func jumps():
	if Input.is_action_just_pressed("jump") and left_jump > 0:
		velocity.y = -jump
		left_jump -= 1

	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = -jump
		if is_on_wall() and Input.is_action_pressed("ritgh"):
			velocity.y = -jump
			velocity.x = -wall_jump
		if is_on_wall() and Input.is_action_pressed("left"):
			velocity.y = -jump
			velocity.x = wall_jump

func attack():
	if Input.is_action_just_pressed("attack"):
		var bullt = preload("res://bull.tscn").instantiate()
		var mouse_pos = get_global_mouse_position()
		var direction = global_position.direction_to(mouse_pos)
		bullt.set_direction(direction)
		bullt.global_position = $sperit/Sprite2D/Marker2D.global_position
		get_parent().add_child(bullt)


func _ready():
	$"Timer/shoot Timer".autostart = true
	$"Timer/shoot Timer".wait_time = 1.5

func _on_shoot_timer_timeout() -> void:
	var bullt = preload("res://bull.tscn").instantiate()
	var mouse_pos = get_global_mouse_position()
	var direction = global_position.direction_to(mouse_pos)
	bullt.set_direction(direction)
	bullt.global_position = $Sprite2D/Marker2D.global_position
	get_parent().add_child(bullt)
