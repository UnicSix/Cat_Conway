extends Area2D

var isAlive
var botInArea
var pub_col
var py_sprite
var isHoldingL
var isHoldingR
var live_time

func _ready():
	pub_col = self.get_parent().get_node('pub/col')
	py_sprite = self.get_parent().get_node('rcv/cat')

	isAlive = not self.get_parent().get_node('pub/col').disabled
	isHoldingL = false
	isHoldingR = false
	botInArea=0
	live_time=0

func _process(_delta):
	isAlive = not self.get_parent().get_node('pub/col').disabled
	if Input.is_action_pressed("left click"):
		isHoldingL = true
	elif Input.is_action_pressed("right click"):
		isHoldingR = true
	else:
		isHoldingL = false
		isHoldingR = false
		
	
func _unhandled_input(_event):
	if Input.is_action_just_pressed("start"):
		if $Timer.is_stopped():
			$Timer.start()
		else:
			$Timer.stop()
	if Input.is_action_just_pressed("clear"):
		pub_col.set_deferred('disabled', true)
		py_sprite.set_deferred('visible', false)
	
func _on_timer_timeout():
	# isAlive = not pub_col.get_deferred('disabled')
	# 復活
	if not isAlive and botInArea==3:
		pub_col.set_deferred('disabled', false)
		py_sprite.set_deferred('visible', true)
	# 族群過小死亡
	elif isAlive and botInArea<2:
		pub_col.set_deferred('disabled', true)
		py_sprite.set_deferred('visible', false)
		live_time=0
	# 族群過大死亡
	elif isAlive and botInArea>3:
		pub_col.set_deferred('disabled', true)
		py_sprite.set_deferred('visible', false)
		live_time=0

func _on_area_entered(_area):
	if _area.get_parent().get_node('pub/col') != pub_col:
		botInArea+=1

func _on_area_exited(_area):
	if _area.get_parent().get_node('pub/col') != pub_col:
		botInArea-=1

func _on_input_event(_viewport:Node, _event:InputEvent, _shape_idx:int):
	# pass
	if Input.is_action_just_pressed("right click"):	
		pub_col.set_deferred('disabled', true)
		py_sprite.set_deferred('visible', false)
	elif Input.is_action_just_pressed("left click"):
		pub_col.set_deferred('disabled', false)
		py_sprite.set_deferred('visible', true)

func _on_mouse_entered():
	if isHoldingL:
		pub_col.set_deferred('disabled', false)
		py_sprite.set_deferred('visible', true)
	if isHoldingR:
		pub_col.set_deferred('disabled', true)
		py_sprite.set_deferred('visible', false)
