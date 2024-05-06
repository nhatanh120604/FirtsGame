extends Node2D

const SPEED = 60
var direction =1
@onready var raycastright = $raycastright
@onready var raycastleft = $raycastleft
@onready var animated_sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.


func _process(delta):
	if raycastright.is_colliding():
		animated_sprite.flip_h=true
		direction=-1
	if raycastleft.is_colliding():
		animated_sprite.flip_h=false
		direction=1
	position.x += SPEED*delta*direction
