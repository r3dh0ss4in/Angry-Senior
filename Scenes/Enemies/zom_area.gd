extends Area2D

class_name Zom_Area

var farena_in_range:bool=false


func Zom_REl():
	const bullet=preload("res://Scenes/Enemies/zom.tscn")
	var new_b=bullet.instantiate()
	new_b.global_position=%ZomPoint.position
	%ZomPoint.add_child(new_b)



func _on_shoot_timer_timeout() -> void:
	if farena_in_range:
		Zom_REl()
	else:
		pass

func _on_body_entered(body: Node2D) -> void:
	if body is Farena:
		farena_in_range=true

func _on_body_exited(body: Node2D) -> void:
	if body is Farena:
		farena_in_range=false
