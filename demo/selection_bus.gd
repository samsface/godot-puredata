extends Node

signal play_mode_begin
signal play_mode_end

var selection_ := []
var hovering

func add_to_selection(node) -> void:
	selection_.push_back(node)
	node._select()

func add_all(nodes:Array) -> void:
	for n in nodes:
		if not n.has_method("_select"):
			n = n.get_parent()
		add_to_selection(n)

func change_selection(node) -> void:
	clear_selection()
	add_to_selection(node)
	
func remove_from_selection(node) -> void:
	if not node:
		return

	selection_.erase(node)
	node._unselect()

func clear_selection() -> void:
	var copy = selection_.duplicate()
	selection_.clear()

	for s in copy:
		s._unselect()

func is_selected(n) -> bool:
	return selection_.has(n)

func remove_from_hover(node) -> void:
	if hovering == node:
		hovering = null

func remove_from_all(node) -> void:
	remove_from_hover(node)
	remove_from_selection(node)

func is_empty() -> bool:
	return selection_.is_empty()


func find_closet_node(nodes:Array, pos:Vector2) -> Node:
	var closest_node
	var closest_distance = 999999
	for node in nodes:

		# for controls measure from the center
		var offset = Vector2.ZERO
		if node is Control:
			offset += node.size * 0.5

		var d = (node.global_position + offset).distance_to(pos)
		if d < closest_distance:
			closest_node = node
			closest_distance = d

	return closest_node

func find_closet_node_with_skip(nodes:Array, pos:Vector2, skip:Callable) -> Node:
	var closest_node
	var closest_distance = 999999
	for node in nodes:

		# for controls measure from the center
		var offset = Vector2.ZERO
		if node is Control:
			offset += node.size * 0.5

		if skip.call(node):
			continue

		var d = (node.global_position + offset).distance_to(pos)
		if d < closest_distance:
			closest_node = node
			closest_distance = d

	return closest_node
