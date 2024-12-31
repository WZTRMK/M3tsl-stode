extends Control
func _ready():
	$AnimationPlayer.play("RESET")

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("ui")
func pause():
	get_tree().paused = true
	$AnimationPlayer.play("ui")

func testEsc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()

func _on_resume_pressed():
	resume()





func _on_quit_pressed():
	get_tree().quit()

func _process(delta):
	testEsc()


func _on_relo_pressed():
	resume()
	pass # Replace with function body.
