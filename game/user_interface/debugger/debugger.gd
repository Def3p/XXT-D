class_name Debugger
extends Control

var label_data: Array = []
var label_list: Array[Node] = []
var ready_label_names: Array[Node] = []

func _ready() -> void:
	for child in %VBoxContainer.get_children():
		label_list.append(child)
	ready_label_names = label_list
	label_data = range(0, len(label_list) - 1)
	
func _process(delta: float) -> void:
	for number in range(0, len(label_list) - 1):
		label_list[number].text = ready_label_names[number].text

func data_initialization(label_number: int, input_data):
	label_list[label_number].text += str(input_data)
