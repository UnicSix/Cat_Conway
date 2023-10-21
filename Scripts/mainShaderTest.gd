extends Node2D

@onready var player = preload("res://Nodes/pyShaderTest.tscn")
var rd = RandomNumberGenerator.new()
var pos_tran = Transform2D()
var rdBoundx = (WIDTH_PX / GRID_UNIT)-1
var rdBoundy = (HEIGHT_PX / GRID_UNIT)
var spawn_pos #= Vector2(GRID_UNIT*rd.randi_range(-rdBoundx, rdBoundx), GRID_UNIT*rd.randi_range(-rdBoundy, rdBoundy))
const WIDTH_PX = 1920
const HEIGHT_PX = 1080
const GRID_UNIT = 32
var valid_pos = [[]]
var init_state = [[]]
var isSpawned = false
#var fix_pos

func _ready():
	isSpawned=true
	for i in rdBoundx:
		valid_pos.append([])
		init_state.append([])
		for j in rdBoundy:
			valid_pos[i].append(Vector2((i+1)*GRID_UNIT, (j+1)*GRID_UNIT))
			init_state[i].append(randi_range(0,1))
	for i in rdBoundx:
		for j in rdBoundy:
			var py = player.instantiate()
			py.position = valid_pos[i][j]
			call_deferred("add_child", py)
			# py.get_node('rcv/Sprite2D').visible = false
			# py.get_node("pub/pub_col1").set_deferred('disabled', true)
			if init_state[i][j] == 0:
				py.get_node("pub/col").set_deferred('disabled', true)
				py.get_node('rcv/cat').visible = false
			else:
				py.get_node("pub/col").set_deferred('disabled', false)

func _process(_delta):
	pass

func _unhandled_input(_event):
	if Input.is_action_just_pressed('restart'):
		get_tree().reload_current_scene()
	elif Input.is_action_just_pressed('quit'):
		get_tree().quit()
