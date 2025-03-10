@tool
class_name TradeTableEditor
extends Control
var id_line_edit : LineEdit
var button : Button
var label : Label
@export var ids_must_exist_in_database := false


var trade_table: TradeTable
var trades:Array[TradesEditor]
var database : InventoryDatabase
func load_table(table:TradeTable, database:InventoryDatabase):
	self.database = database
	if table != null:
		self.trade_table = table
func _load_trades():
	pass

func _ready()->void:
	pass
func _apply_theme() -> void:
	if not is_instance_valid(button):
		return
	button.icon = get_theme_icon("Edit", "EditorIcons")
	button.tooltip_text = "Edit"

func has_in_database(id : String) -> bool:
	return database.has_item_id(id)
func setup(database : InventoryDatabase, id : String):
	self.database = database
	self.id = id
	id_line_edit.text = id
	id_line_edit.editable = false
	button.disabled = false
	id_line_edit.tooltip_text = ""
	button.tooltip_text = "Edit"
	id_line_edit.modulate = Color.WHITE


func _on_theme_changed():
	_apply_theme()


func _on_id_value_changed(value):
	_check_valid_id()
