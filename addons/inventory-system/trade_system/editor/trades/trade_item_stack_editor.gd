@tool
class_name TradeItemStackEditor
extends HBoxContainer

@onready var item_id_edit:LineEdit = %RequiredItemIdTextEdit
@onready var required_amount_box:SpinBox = %RequiredAmountBox
@onready var required_max_box:SpinBox = %RequiredMaxAmtBox
@onready var required_min_box:SpinBox = %RequiredMinAmtBox
@onready var delete_button:Button = %DeleteButton

var database : InventoryDatabase

func _on_delete_button_up() -> void:
	pass # Replace with function body.
func _ready()->void:
	pass
