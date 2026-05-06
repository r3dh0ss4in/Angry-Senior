extends Area2D

@export var speed:int=500

var direction:int=1

func _process(delta: float) -> void:
	position.x+=speed*direction*delta

func _on_body_entered(body: Node2D) -> void:
	if body is TileMapLayer:
		queue_free()
	elif body is ew_coll:
		body.queue_free()
		
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area is EW:
		area.queue_free()
