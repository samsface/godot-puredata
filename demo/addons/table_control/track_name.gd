extends Control

@export var value:NodePath : 
	set(v):
		value = v
		invalidate_()

@export_multiline var condition_ex:String :
	set(v):
		condition_ex = v
		invalidate_()

func invalidate_() -> void:
	if condition_ex.is_empty():
		$H/Condition.visible = false
	else:
		$H/Condition.visible = true
		$H/Condition.text = condition_ex.replace("\n", " ")
		
	$H/Value.text = str(value).get_file()

func set_indent(level:int) -> void:
	$H/Value.visible = level == 0
	$H/Indent.visible = level > 0
