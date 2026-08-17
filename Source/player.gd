extends CharacterBody2D
@onready var sprite = get_node("sprite")
var jT = 0
const JUMP_VELOCITY = -800.0

func _physics_process(delta: float) -> void:
	if Global.move:
		jT-=1
		if not is_on_floor():
			velocity += get_gravity() * delta
			sprite.rotation_degrees+=5
			sprite.rotation_degrees=int(sprite.rotation_degrees)%360
		else:
			sprite.rotation_degrees=int(sprite.rotation_degrees)%360
			sprite.rotation_degrees=round(sprite.rotation_degrees/90)*90
		if  (jT>0 or Input.is_action_pressed("ui_accept")) and is_on_floor():
			velocity.y = JUMP_VELOCITY
			jT = 0
		elif Input.is_action_pressed("ui_accept"):
			jT = 5
		move_and_slide()
