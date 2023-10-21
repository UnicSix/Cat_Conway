extends Sprite2D

var cat_mat = preload("res://Material/player.material")
var live_time:float = 0

func _ready():
	pass
	# self.material = cat_mat;
	# set_material(get_material().duplicate())

func _process(_delta):
	if self.visible == false:
		live_time=0
		# cat_mat.set_shader_parameter("isShown", 0)
		# self.material = cat_mat

func _on_timer_timeout():
	if self.visible == true:
		live_time+=1

	if live_time>5:
		cat_mat.set_shader_parameter("isShown", 0.5)
		self.material = cat_mat
		print('shader parameter: ', cat_mat.get_shader_parameter("isShown"))
		print('live time:', live_time)


# func _unhandled_input(_event):
# 	if Input.is_action_just_pressed("left click"):
# 		cat_mat.set_shader_parameter("isShown", 0.5)
# 		self.material = cat_mat
# 	elif Input.is_action_just_pressed("right click"):
# 		cat_mat.set_shader_parameter("isShown", 0)
# 		self.material = cat_mat
