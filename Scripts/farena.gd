extends CharacterBody2D

const SPEED:int=150
const JUMP_VELOCITY:int=-310
var DOUBLE_JUMP=false

@onready var animated_sprite=$AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity+=get_gravity()*delta
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y=JUMP_VELOCITY
		DOUBLE_JUMP=true
	if not is_on_floor() and Input.is_action_just_pressed("jump") and DOUBLE_JUMP:
		velocity.y=JUMP_VELOCITY
		DOUBLE_JUMP=false
	var direction=Input.get_axis("move_left","move_right")
	if direction:
		velocity.x=direction*SPEED
		if direction>0:
			animated_sprite.flip_h=false
		elif direction<0:
			animated_sprite.flip_h=true
		animated_sprite.play("Run")
	else:
		velocity.x=move_toward(velocity.x,0,SPEED)
		animated_sprite.play("Idle")
	if not is_on_floor():
		animated_sprite.play("Jump")
	move_and_slide()
