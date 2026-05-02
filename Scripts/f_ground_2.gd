extends AnimatableBody2D

@export var Distance1:int=200
@export var Distance2:int=40
@export var time:float=4

func _ready() -> void:
	sync_to_physics = true
	var tween=create_tween()
	tween.set_loops(-1)
	tween.tween_property(self,"position",Vector2.DOWN*Distance1,time).as_relative()
	tween.tween_property(self,"position",Vector2.RIGHT*Distance2,1).as_relative()
	tween.tween_property(self,"position",Vector2.UP*Distance1,time).as_relative()
	tween.tween_property(self,"position",Vector2.LEFT*Distance2,1).as_relative()
