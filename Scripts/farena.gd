extends CharacterBody2D

class_name Farena
signal healthChanged

const SPEED:int=150
const JUMP_VELOCITY:int=-310
var DOUBLE_JUMP:bool=false
var is_dead:bool=false

@export var maxHealth=100
@onready var currentHealth:int=(maxHealth/2)

@onready var animated_sprite=$AnimatedSprite2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		const bullet = preload("res://Scenes/f_bullet.tscn")
		var new_b = bullet.instantiate()
		if animated_sprite.flip_h:
			new_b.direction = -1
			new_b.scale.x = -1 
		else:
			new_b.direction = 1
			new_b.scale.x = 1
			
		new_b.global_position = %ShootMark.global_position
		get_tree().current_scene.add_child(new_b)

func _physics_process(delta: float) -> void:
	if is_dead:
		return
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
		animated_sprite.play("run_shoot")
	else:
		velocity.x=move_toward(velocity.x,0,SPEED)
		animated_sprite.play("shoot")
	if not is_on_floor():
		animated_sprite.play("jump_shoot")
	move_and_slide()


func _on_g_traps_body_entered(body: Node2D) -> void:
	if is_dead:
		return
	currentHealth-=50
	#print(currentHealth)
	if currentHealth<=0:
		die()
	healthChanged.emit()

func take_damage(amount:int):
	if is_dead:
		return
	currentHealth-=amount
	healthChanged.emit()
	if currentHealth<=0:
		currentHealth=0
		die()

func die():
	is_dead=true
	velocity=Vector2.ZERO
	animated_sprite.play("Dead")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/Level_1/Dead.tscn")

func _on_life_body_entered(body: Node2D) -> void:
	if currentHealth<100:
		currentHealth+=10
	elif (currentHealth+10)>=100:
		currentHealth=100
	#print(currentHealth)
	healthChanged.emit()


func _on_life_15_body_entered(body: Node2D) -> void:
	if currentHealth<100:
		currentHealth+=15
	elif (currentHealth+15)>=100:
		currentHealth=100
	#print(currentHealth)
	healthChanged.emit()


func _on_life_20_body_entered(body: Node2D) -> void:
	if currentHealth<100:
		currentHealth+=20
	elif (currentHealth+20)>=100:
		currentHealth=100
	#print(currentHealth)
	healthChanged.emit()
