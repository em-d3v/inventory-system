@tool
class_name  ItemTradesTableListEditor
extends VBoxContainer
signal selected
signal popup_menu_requested(at_position: Vector2)

var list:ItemList
var search_icon : TextureRect
var search_line_edit : LineEdit
var control: Control

var item_map : Dictionary = {}
var list_handler : Array

var trade_tables:Array=[]:
	set(next_files):
		trade_tables = next_files
		trade_tables.sort()
	get:
		return trade_tables
var filter: String:
	set(next_filter):
		filter = next_filter
		apply_filter()
	get:
		return filter
func load_items(items : Array) -> void:
	clear_items()
	for item in items:
		add_item(item)
	update_item_map()
	apply_filter()


func add_item(item):
	trade_tables.append(item)
	update_item_map()
	apply_filter()


func clear_items():
	trade_tables.clear()


func update_item_map() -> void:
	item_map = {}
	for item in trade_tables:
		item_map[item.id] = item

func get_index_of_item_id(id : String) -> int:
	for index in list_handler.size():
		var item = list_handler[index]
		if item.id == id:
			return index
	return -1

func apply_filter() -> void:
	list_handler.clear()
	for item_id in item_map.keys():
		var item = item_map[item_id]
		if item == null:
			continue
		
		if filter == "" or item == null or filter.to_lower() in item.name.to_lower(): # search by item name
			list_handler.append(item)
		
		if item is ItemDefinition and item not in list_handler: # search by category name
			for item_category in item.categories:
				if item not in list_handler and filter.to_lower() in item_category.name.to_lower():
					list_handler.append(item)
					
	update_list(list_handler)

func _on_item_list_item_activated(index):
	var item_text = list.get_item_text(index)
	var item_database = item_map.find_key(int(item_text))

func update_list(handler):
	pass
func load_tables(database:InventoryDatabase):
	pass
func _on_item_list_item_clicked(index, at_position, mouse_button_index):
	pass
func _on_search_line_edit_text_changed(new_text):
	filter = new_text
