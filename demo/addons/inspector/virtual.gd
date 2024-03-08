extends Node
class_name InpsectorVirtualProperties

@export var node:Control : 
	set(v):
		node = v

var grid_size : 
	set(v):
		pass
	get:
		return get_parent().piano_roll_.grid_size

enum Type {
	bang,
	slide,
	method
}

@export var type:Type : 
	set(value):
		get_parent().change_type_(node, value)
	get:
		return node.get_meta("__type__", Type.bang)

@export var time:int : 
	set(value):
		node.position.x = value * grid_size
	get:
		return int(node.position.x / grid_size)

@export var length:int = 1 : 
	set(value):
		node.size.x = value * grid_size
	get:
		return int(node.size.x / grid_size)