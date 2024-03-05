extends HBoxContainer

signal value_changed

@export var value:float :
	set(v):
		value = v
		$Value.value = v

func _value_changed(value):
	value_changed.emit(value)
