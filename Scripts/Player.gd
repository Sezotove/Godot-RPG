extends KinematicBody2D

export (int) var speed = 175
var velocity = Vector2()
var facing_dir = 0 #Zero is default and = idle/down
var isAttacking = false

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right1"):
		velocity.x += 1
		$AnimatedSprite.play("WalkRight")
		facing_dir = 1
	if Input.is_action_pressed("left1"):
		velocity.x -= 1
		$AnimatedSprite.play("WalkLeft")
		facing_dir = 2
	if Input.is_action_pressed("down1"):
		velocity.y += 1
		$AnimatedSprite.play("WalkDown")
		facing_dir = 3
	if Input.is_action_pressed("up1"):
		velocity.y -= 1
		$AnimatedSprite.play("WalkUp")
		facing_dir = 4
	velocity = velocity.normalized() * speed
	
#	if Input.is_action_pressed("quick_attack1"):
#		$AnimatedSprite.play("AttackRight")
		
	if Input.is_action_just_pressed("quick_attack1") && facing_dir ==  1:
		$AnimatedSprite.play("AttackRight")
		isAttacking = true
	elif Input.is_action_just_pressed("quick_attack1") && facing_dir ==  2:
		$AnimatedSprite.play("AttackLeft")
		isAttacking = true
	elif Input.is_action_just_pressed("quick_attack1") && facing_dir ==  3:
		$AnimatedSprite.play("AttackDown")
		isAttacking = true
	elif Input.is_action_just_pressed("quick_attack1") && facing_dir ==  4:
		$AnimatedSprite.play("AttackUp")
		isAttacking = true


func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)


func _on_AnimatedSprite_animation_finished():
	if  ($AnimatedSprite.animation == "AttackRight"
		or $AnimatedSprite.animation == "AttackLeft"
		or $AnimatedSprite.animation == "AttackDown"
		or $AnimatedSprite.animation == "AttackUp"):
		isAttacking = false
