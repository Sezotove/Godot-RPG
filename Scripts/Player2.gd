extends KinematicBody2D

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

export (int) var speed = 100
var state = MOVE
var velocity = Vector2()


enum{
	MOVE,
	ROLL,
	ATTACK
}

func _ready():
	animationTree.active = true

func _process(delta):
	match state:
		MOVE:
			move_state(delta)
		ROLL:
			pass
		ATTACK:
			attack_state(delta)
	

func move_state(delta):
	
	var input_dir = Vector2(
	Input.get_action_strength("right2") - Input.get_action_strength("left2"),
	Input.get_action_strength("down2") - Input.get_action_strength("up2")).normalized()

	if input_dir != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_dir)
		animationTree.set("parameters/Run/blend_position", input_dir)
		animationTree.set("parameters/Attack/blend_position", input_dir)
		animationState.travel("Run")
	else:
		animationState.travel("Idle")
	
	move_and_slide(input_dir * speed)
	
	if Input.is_action_just_pressed("quick_attack2"):
		state = ATTACK

func attack_state(delta):
	animationState.travel("Attack")

func attack_animation_finished():
	state = MOVE

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("quick_attack1"):
		pass


