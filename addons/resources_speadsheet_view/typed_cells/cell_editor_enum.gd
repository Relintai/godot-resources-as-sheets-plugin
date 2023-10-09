extends CellEditor


func can_edit_value(value, type, property_hint, column_index) -> bool:
	return type == TYPE_INT and property_hint == PROPERTY_HINT_ENUM


func set_value(node : Control, value):
	var arr = hint_strings_array[node.get_position_in_parent() % hint_strings_array.size()]
	var s : int = arr.size()
	
	if value < s && value >= 0:
		node.text = arr[value]
	else:
		print("CellEditor: Invalid enum value! " + str(value))
		node.text = str(value)
		
	node.self_modulate = Color(node.text.hash()) + Color(0.25, 0.25, 0.25, 1.0)
	node.align = Label.ALIGN_CENTER


func is_text():
	return false
