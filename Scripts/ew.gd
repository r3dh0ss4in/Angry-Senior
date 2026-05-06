extends Area2D

class_name EW

var farena_in_range:bool=false


func shoot():
	const bullet=preload("res://Scenes/Enemies/bullet.tscn")
	var new_b=bullet.instantiate()
	new_b.global_position=%ShootPoint.position
	%ShootPoint.add_child(new_b)



func _on_shoot_timer_timeout() -> void:
	if farena_in_range:
		shoot()
	else:
		pass


func _on_body_entered(body: Node2D) -> void:
	if body is Farena:
		farena_in_range=true


func _on_body_exited(body: Node2D) -> void:
	if body is Farena:
		farena_in_range=false
