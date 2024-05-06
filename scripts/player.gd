extends CharacterBody2D

var dying = false
const SPEED = 200.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var die_effect = $dieEffect
@onready var jump_effect = $jumpEffect
@onready var ui = $"../UI"

var on_ladder = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func timeStop():
	ui.get_node("Panel").stop()

func die():
	dying=true
func dieSound():
	die_effect.play()
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor() and !on_ladder:
		velocity.y += gravity * delta
	
	if on_ladder:
		if Input.is_action_pressed("moveup"):
			velocity.y = -SPEED*delta*20
		elif Input.is_action_pressed("movedown"):
			velocity.y = +SPEED*delta*20
		else:
			velocity.y=0
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction -1 0 1
	var direction = Input.get_axis("move_left", "move_right")
	#flip the sprite
	if direction>0:
		animated_sprite_2d.flip_h=false
	if direction<0:
		animated_sprite_2d.flip_h=true
	#play animation:
	if dying == true:
				
		animated_sprite_2d.play("die")
				
	elif is_on_floor():
		if direction ==0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	if Input.is_action_just_pressed("jump") and !on_ladder:
		jump_effect.play()
		animated_sprite_2d.play("jump")
			

	#apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
			
			
	move_and_slide()
