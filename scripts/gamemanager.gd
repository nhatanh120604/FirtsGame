extends Node
@onready var timer = $Timer

var count =0
var highscore=0
var time:float = 0.0
var minutes: int =0
var seconds: int=0
var msec: int = 0
const SAVE_PATH="user://savedata.save"
@onready var ui = $"../UI"



func add_():
	count+=1
	if (count==27):
		endgame()
	ui.get_node("Coin").text="Coins: "+str(count)+"/27"
func endgame():
	ui.get_node("Win").visible=true
	ui.get_node("Panel").stop()
	timer.start()
	

func _on_timer_timeout():
	get_tree().reload_current_scene() # Replace with function body.
