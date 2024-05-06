extends Node

var count =0
@onready var ui = $"../UI"

func add_():
	count+=1
	if (count==23):
		ui.get_node("Label2").visible=true
		ui.get_node("Panel").stop()
		get_tree().reload_current_scene()
	
	
	ui.get_node("Label").text="Coins: "+str(count)+"/23"
	
