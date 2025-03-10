@tool
class_name TradesEditor
extends InventoryTabEditor
@onready var trade_table_editor = $HSplitContainer/TradeTableEditor
@onready var trade_table_list:ItemTradesTableListEditor = $HSplitContainer/ItemTradesTableListEditor
@onready var popup_menu:PopupMenu = %TradeTablesPopupMenu


func _ready():
	super._ready()
	#trade_table_editor.
	_apply_theme()
func on_load_database() -> void:
	trade_table_editor.load_table(null, database)
	#load_items()

func set_editor_plugin(editor_plugin : EditorPlugin):
		self.set_editor_plugin(editor_plugin)
		trade_table_editor.set_editor_plugin(editor_plugin)
		_apply_theme()

func load_tables()->void:
	trade_table_editor.visble = false
	
	pass
func _add_to_database(table : TradeTable):
	pass

func _on_trade_tables_popup_menu_id_pressed(id: int) -> void:
	pass # Replace with function body.
