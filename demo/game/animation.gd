extends CanvasLayer

func _input(event):
	if event.is_action_pressed("toggle_piano_roll"):
		$VSplitContainer/BeatPlayerHost.visible = not $VSplitContainer/BeatPlayerHost.visible
