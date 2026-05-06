extends Area2D

@export var speed:float=300
@export var damage:int=10

func _ready() -> void:
	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)
	
	if not area_entered.is_connected(_on_area_entered):
		area_entered.connect(_on_area_entered)

func _process(delta: float) -> void:
	position+=Vector2.LEFT.rotated(rotation)*speed*delta


func _on_body_entered(body: Node2D) -> void:
	if body is Farena:
		body.take_damage(damage)
		queue_free()
	if body is TileMapLayer:
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area is EW:
		area.queue_free()
