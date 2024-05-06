extends Node

var count =0
@onready var ui = $"../UI"

func add_():
	count+=1
	ui.get_node("Label").text="Coins: "+str(count)+"/23"
	
