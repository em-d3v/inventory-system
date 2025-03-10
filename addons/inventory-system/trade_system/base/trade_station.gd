@tool
@icon("res://addons/inventory-system/icons/trade_station.svg")
class_name TradeStation extends NodeInventories
## A node that represents a trader
enum InventoryType{
	INPUT,
	OUTPUT,
	STORAGE
}
## The name of your trading station
@export var station_name:String = "Trade Station"
## trade table id 
## Note: [b]On[/b]
@export var table_id:String
## Input Inventory Node
@export var inputs:Array[Inventory]
## This Node is where your 
@export var outputs: Array[Inventory]
## if limited storage is enabled, set inventory node
@export var storage:Inventory = null
## if enabled trade station will use storage
@export var limited_storage:bool = false
var only_remove_items_after_trade:bool = false
var limit_number_of_trades:bool
## 
var trading_time_enabled:bool = false
var restock_time:int
var trade_table:TradeTable
var tradings:Array[Trading]

## Emitted when 
signal restocked(item:ItemStack)
## Emitted when TradeStation is in low storage of item
signal low_storage(item:ItemStack)
## emitted when inventory is added
signal input_inventory_added(path:NodePath)
## emitted when inventory is added
signal input_inventory_removed(path:NodePath)
## emitted when inventory is added
signal output_inventory_added(path:NodePath)
## emitted when inventory is added
signal output_inventory_removed(path:NodePath)
## emitted 
signal storage_inventory_added(path:NodePath)
## Emited when an inventory for 
signal storage_inventory_removed(path:NodePath)
## emitted at the start of the _restock method
signal requested_restock(item_id:String, properties:Dictionary)
## emitted when trade is requests
signal requested_trade(trade_index:int)
## emitted when trade is successfully completed 
signal traded(index:int)
func set_only_remove_items_after_trade(value:bool)->void:
	only_remove_items_after_trade = value
func get_only_remove_items_after_trade()->bool:
	return only_remove_items_after_trade
func trade(trade_index:int)->void:
	self.traded.emit(trade_index)
## 
func has_trade(item_id:String,level:int=-1, properties:Dictionary={})->bool:
	
	return false
## Get Inventory by Inventory Name
## [code]inventory_name[/code]
## [code]type[/code] - "inputs" , outputs, or storage
func get_inventory_by_name(inventory_name:String,type:InventoryType)->Inventory:
	match type:
		InventoryType.INPUT:
			pass
		InventoryType.OUTPUT:
			pass
		InventoryType.STORAGE:
			pass
		_:
			return null
	return null
func get_inventory_index(inventory_name:String, from_array:String)->int:
	return -1
func get_inventory_by_index(index:int, from_array:String)->Inventory:
	return null
func get_input_inventory(index:int):
	if inputs.size() >= index:
		return inputs[index]
	return null
func get_inventory_output(index:int):
	if inputs.size() >= index:
		return inputs[index]
	return null
func get_inventory_storage(index:int):
	if inputs.size() >= index:
		return inputs[index]
	return null
func add_inventory(inventory:Inventory,to_type:InventoryType, index:int = -1)->void:
	
	match to_type:
		InventoryType.INPUT:
			
			pass
		InventoryType.OUTPUT:
			pass
		InventoryType.STORAGE:
			pass
		_:
			pass
 
func add_input_inventory(inventory:Inventory)->void:
	inputs.append(inventory)
	var path:String = inventory.get_tree_string()
	var node_path:NodePath = NodePath(path)
	input_inventory_added.emit(node_path)
func add_output_inventory(inventory:Inventory)->void:
	outputs.append(inventory)
	var path:String = inventory.get_tree_string()
	var node_path:NodePath = NodePath(path)
	output_inventory_added.emit(node_path)
func add_storage_inventory(inventory:Inventory)->void:
	
	storage_inventory_added.emit(inventory)
func _restock(item_id:String)->void:
	self.request_restock.emit(item_id)
	pass##
## if TradeStation is in storage of item, returns true
func is_in_storage(item:String)->bool:
	
	return false
#func _get_configuration_warnings() -> PackedStringArray:
	
