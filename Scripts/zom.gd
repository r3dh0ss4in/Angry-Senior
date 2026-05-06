extends CharacterBody2D

@export var speed:float=100
@export var damage:int=10

var direction:int=1
var farena_detected:bool=false
var farena:CharacterBody2D=null

@onready var animated_sprite=$AnimatedSprite2D

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity+=get_gravity()*delta
	animated_sprite.flip_h=true
	position+=Vector2.LEFT.rotated(rotation)*speed*delta
	if velocity.x!=0:
		animated_sprite.play("Move")
	else:
		animated_sprite.play("Idle")
	move_and_slide()
