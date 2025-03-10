@tool
class_name TradeTableIDEditor
extends HBoxContainer
signal changed(id : String)

var id_line_edit : LineEdit
var button : Button
var label : Label
@export var ids_must_exist_in_database := false

var database : InventoryDatabase
var id : String
