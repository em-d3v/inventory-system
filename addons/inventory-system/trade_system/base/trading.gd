class_name Trading extends Resource
## 

var trade_index:int
var time:float
## if time
var time_enabled:bool = false
func _init():
	trade_index = 0
	time = 0.0
	time_enabled = false
func _ready():
	pass
func _process(delta)->void:
	if time_enabled == true:
		time-=delta
func set_time(new_time:float)->void:
	time = new_time
