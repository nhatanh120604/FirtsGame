extends CharacterBody2D

var dying = false
const SPEED = 200.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite_2d = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func die():
	dying=true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

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
	if Input.is_action_just_pressed("jump"):
		animated_sprite_2d.play("jump")
	

	#apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	move_and_slide()
