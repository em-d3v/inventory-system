@tool
class_name ItemTradeEditor
extends VBoxContainer

signal changed

@onready var item_id_box:LineEdit = %ItemIdTextEdit
@onready var item_amount_box:SpinBox = %ItemAmountEdit
@onready var new_item_button:Button = %newItemButton
@onready var required_items_container:VBoxContainer = %RequiredItemsVBoxContainer

var trade:ItemTrade
var database : InventoryDatabase
var required_items: Array[TradeItemStackEditor]
var item:ItemStack
var connected:bool
var editor_plugin : EditorPlugin
func _ready():
	apply_theme()
func apply_theme() -> void:
	if not is_instance_valid(editor_plugin):
		return
	
	#Dialogs
	var scale: float = editor_plugin.get_editor_interface().get_editor_scale()

func set_editor_plugin(editor_plugin : EditorPlugin):
	self.editor_plugin = editor_plugin
	apply_theme()
func connect_signals():
	item_id_box.text_changed.connect(_on_item_id_changed)
	item_amount_box.value_changed.connect(_on_item_amount_changed)
	new_item_button.pressed.connect(_on_new_item_button_up)
	connected = true
func disconnect_signals():
	if not connected:
		return
	item_id_box.text_changed.disconnect(_on_item_id_changed)
	item_amount_box.value_changed.disconnect(_on_item_amount_changed)
	new_item_button.pressed.disconnect(_on_new_item_button_up)
	connected = false

func _on_item_id_changed(text:String)->void:
	trade.item
	pass
func _on_item_amount_changed(amount:int)->void:
	pass

func _on_new_item_button_up() -> void:
	
	pass # Replace with function body.
