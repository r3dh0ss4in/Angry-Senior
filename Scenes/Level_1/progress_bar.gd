extends ProgressBar

@export var player:Farena


func _ready() -> void:
	max_value=player.maxHealth
	player.healthChanged.connect(update)
	update()

func update():
	value=player.currentHealth
