class_name LocationSetting
extends Node3D

@export var number_of_chunks: int = 250

@export var enviroment: Enviroment

func _ready() -> void:
	debug_output.data_initialization(0, "test")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
