extends MarginContainer
class_name PDSubpatch

@export var patch_path:String

func hide_text() -> bool:
	return true

func _ready() -> void:
	var file = PureData.files["pd-" + patch_path.get_file()]
	
	for node in file.get_children():
		if node is PDNode:
			if node.visible_in_subpatch:
				var n = node.duplicate()
				n.in_subpatch = true
				add_child(n)
				n._play_mode_begin()
				

func _connection(to) -> void:
	pass

func _pd_init() -> void:

	pass