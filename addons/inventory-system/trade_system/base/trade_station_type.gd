class_name TradeStationType extends Resource
## Determines the type of [TradeStation]

@export var id:String
@export var _name:String
@export var icon:Texture2D
@export var trade_table_id:int

func set_id(new_id)->void:
	id = new_id
func get_id()->String:
	return id
func set_station_name(new_name:String)->void:
	_name = new_name
func get_station_name()->String:
	return _name
func get_icon()->Texture2D:
	return icon
func set_icon(new_icon:Texture2D)->void:
	icon = new_icon
