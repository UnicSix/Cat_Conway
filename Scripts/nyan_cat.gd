extends Sprite2D

var live_time=0
var playerMat = ShaderMaterial.new()
# @onready var playerShader : Shader = preload("res://Shader/player.gdshader")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	# playerMat.shader = playerShader

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_timer_timeout():
	if self.visible == true:
		print(live_time)
		live_time+=1
	else:
		live_time=0
	if live_time>3:
		playerMat.set_shader_parameter("isShown", 0.5)