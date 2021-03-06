extends KinematicBody2D

#Variables
var speed = 0
var velocity = 0
var facingDirection = 0

#Constants
const MAXIMUMSPEED = 300
const MOVEMULTI = 600

func _ready():
	set_process(true)	

	pass

func _process(delta):
	if (Input.is_action_pressed("move_left")):
		facingDirection = -1	
	elif (Input.is_action_pressed("move_right")):
		facingDirection = 1
	else: facingDirection = 0	
		
	if (facingDirection != 0):
		speed += MOVEMULTI * delta
	else: speed -= MOVEMULTI * delta
	
	speed = clamp(speed, 0, MAXIMUMSPEED)
	
	velocity = speed * delta * facingDirection
	move(Vector2(velocity,0))
		
	pass