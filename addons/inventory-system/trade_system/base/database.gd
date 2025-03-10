## Best to merge this script with the InventoryDatabase

extends InventoryDatabase
## this is an extension of the Inventory Database

## Contains an array of trade tables for the
@export var trade_tables:Array[TradeTable]
@export var trade_station_types:Array[TradeStationType]
var trade_tables_cache:Dictionary
var trade_stations_code_cache:Dictionary

func get_trade_tables()->Array:
	return trade_tables
func get_trade_station_types()->Array:
	return trade_station_types
func _update_trade_tables_cache()->void:
	trade_tables_cache.clear()
	for i in trade_tables.size():
		var trade_table:TradeTable = trade_tables[i]
		if trade_table != null:
			trade_tables_cache[trade_table.get_id()] = trade_table
		
#func _update_trade_cache()->void:
	#trade_stations_code_cache.clear()
	#for i in trade_station_types.size():
		#var station_type:TradeStationType = trade_station_types[i]
		#if station_type == null:
			#continue
		##if (Engine.get_singleton().is_editor)
func has_trade_table(table_id:String)->bool:
	if trade_tables.size()>0:
		for trade_table in trade_tables:
			if trade_table.id == table_id:
				return true
	return false
func add_trade_table(new_table:TradeTable)->void:
	# check for existing table
		trade_tables.append(new_table)
		_update_trade_tables_cache()

## Get TradeTable from InventoryDatabase By table id
func get_trade_table(table_id:String)->TradeTable:
	# var trade_table:TradeTable
	if trade_tables.size()>0:
		for trade_table:TradeTable in trade_tables:
			if trade_table.id == table_id:
				return trade_table
	return null
func remove_trade_table(table:TradeTable)->void:
	var index = trade_tables.find(table)
	if index > -1:
		trade_tables.remove_at(index)

func get_table_index(table_id:String)->int:
	var index:int = 0
	var length:int = trade_tables.size()
	var table:TradeTable
	if length > 0:
		while index < length:
			table = trade_tables[index]
			if table.id == table_id:
				return index
			index += 1
		return index
	return -1
func update_trade_table(table_id:String, new_value:TradeTable)->void:
	var table_index:int = self.get_table_index(table_id)
	var trade_table:TradeTable
	if table_index >= 0:
		trade_tables[table_index] = new_value
