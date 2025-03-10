class_name TradeItemStack extends ItemStack
## [code]TradeItemStack[/code]

## this group can be used for random trade generation
@export_group("amount range")
## minimum required for trading
@export var minimum_amount:int
## maximum required for trading
@export var maximum_amount:int
func set_minimum_amount(min:int)->void:
	self.minimum_amount = min

func set_maximum_amount(max:int)->void:
	self.maximum_amount = max

func _init() -> void:
	self.minimum_amount = 0
	self.maximum_amount = 0
