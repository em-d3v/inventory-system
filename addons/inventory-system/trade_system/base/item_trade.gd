class_name ItemTrade extends Resource
## Represents a Trade
## Used in [code]TradeTable[/code]

## The item for trade
@export var item_stack:ItemStack
## Item Trade Level
##  be used to distinguish trades that have the same [code]item_id[/code]
@export var level:int = 0
## Items required to make the trade
@export var required_item_stacks: Array[TradeItemStack]:
	set(value):
		required_item_stacks = value
	get:
		return required_item_stacks

## The Chance of this 
@export var chance:float

func set_level(value:int)->void:
	self.level = value

func get_level()->int:
	return self.level

func set_item_stack(item_stack:ItemStack)->void:
	self.item = item_stack

func get_item_stack()->ItemStack:
	return self.item

func add_required_item(item_id:String)->void:
	if item_id.length() > 0:
		var item_trade_stack:TradeItemStack = TradeItemStack.new()
		item_trade_stack.item_id = item_id
func get_required_item(index:int)->TradeItemStack:
	var required_item:TradeItemStack = null
	var length:int = required_item_stacks.size()
	if length> 0 and length >= index:
		required_item = required_item_stacks[index]
	return required_item
## set required item using ItemStack
## will convert it to TradeItemStack
func set_required_item(index:int, item_stack:ItemStack)->void:
	var required_item:TradeItemStack
	var length:int = required_item_stacks.size()
	if length> 0 and length >= index:
		required_item = required_item_stacks[index]
		

func get_required_item_as_item_stack(index:int)->ItemStack:
	return null
func update_required_item(index:int, new_value:TradeItemStack)->void:
	var length:int = required_item_stacks.size()
	var value:TradeItemStack
	if length> 0 and length >= index:
		value = required_item_stacks[index]
		required_item_stacks[index] = new_value
	
func remove_required_item(index:int)->void:
	var required_item:TradeItemStack
	var length:int = required_item_stacks.size()
	if length> 0 and length >=index:
		required_item = required_item_stacks[index]
		if required_item != null:
			required_item.free()
		required_item = null
		#required_items.pop_at(index)
