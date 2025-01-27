@tool
extends Resource
class_name LabelStyle

@export var size:int : 
	set(v):
		size = v
		emit_changed()
@export var font:Font :
	set(v):
		font = v
		emit_changed()
@export_range(-1.0, 1.0) var curve:float :
	set(v):
		curve = v
		emit_changed()
@export var color:Color :
	set(v):
		color = v
		emit_changed()
