extends Area2D




func _on_body_entered(body):
	body.on_ladder=true # Replace with function body.


func _on_body_exited(body):
	body.on_ladder=false# Replace with function body.
