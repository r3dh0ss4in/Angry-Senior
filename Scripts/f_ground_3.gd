extends AnimatableBody2D

@export var Distance:int=350
@export var time:float=4

func _ready() -> void:
	sync_to_physics = true
	var tween=create_tween()
	tween.set_loops(-1)
	tween.tween_property(self,"position",Vector2.UP*Distance,time).as_relative()
	tween.tween_property(self,"position",Vector2.DOWN*Distance,time).as_relative()
