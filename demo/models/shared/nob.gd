extends Node3D
class_name Nob

var intended_value := 0.0
var reset_to_intended_value_tween_:Tween

func get_guide_position_for_value(value:float) -> Vector3:
	return Vector3.ZERO

func get_nob_position() -> Vector3:
	return Vector3.ZERO
	
func reset_to_intended_value(delay:float = 2.0) -> void:
	if reset_to_intended_value_tween_:
		reset_to_intended_value_tween_.kill()

	reset_to_intended_value_tween_ = create_tween()
	reset_to_intended_value_tween_.tween_interval(delay)
	reset_to_intended_value_tween_.finished.connect(reset_)

func reset_() -> void:
	set("value", intended_value)