## TRADE SYSTEM
## TRADE TABLE
##  
##
##
##
##
@icon("res://addons/inventory-system/icons/trade_table.svg")
class_name TradeTable extends Resource
## Represents a table of trades for TradeStation node

## TradeTable id
@export var id:String = "":
	set(value):
		id = value
	get:
		return id
## List of trades
@export var trades:Array[ItemTrade]
@export var station_type:TradeStationType

func set_id(new_id)->void:
	id = new_id
func get_id()->String:
	return id

## Adds trade to table
## if index is not given then trade will be added at end of array.
func add_trade(trade:ItemTrade, index:int = -1)->void:
	#trades.append(trade)
	if index >= 0:
		trades.insert(index, trade)
	else:
		trades.append(trade)

func update_trade(index:int, new_trade:ItemTrade)->void:
	if trades.size() >= index:
		trades[index] = new_trade
func remove_trade(index:int)->void:
	if trades.size()>=index:
		trades.remove_at(index)
## Returns an array of trade indexes based on [code]item_id[/code]
func get_trades_index_by_item_id(item_id:String)->Array[int]:
	var trades_for_item:Array = []
	var table_size:int = trades.size() 
	if table_size > 0:
		for index:int in table_size:
			if trades[index].item_stack != null:
				if trades[index].item_stack.item_id == item_id:
					trades_for_item.append(index)
	return trades_for_item
func get_trades_index_by_required_item(item_id:String)->Array[int]:
	var indexes:Array = []
	return indexes
## Get an Array of trade indexes by trade level
func get_trades_index_by_level(level:int)->Array[int]:
	var indexes:Array = []
	return indexes
## Get [code][/code] on index
func get_trade(index:int)->ItemTrade:
	if trades.size() >= index:
		if trades[index] != null:
			return trades[index]
	return null
