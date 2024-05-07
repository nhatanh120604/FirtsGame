extends Panel

var time:float = 0.0
var minutes: int =0
var seconds: int=0
var msec: int = 0
var minutes2: int =0
var seconds2: int=0
var msec2: int = 0

func _process(delta)-> void:
	if Score.check>0:
		msec2 = fmod(Score.highscore,1)*100
		seconds2= fmod(Score.highscore,60)
		minutes2 = fmod(Score.highscore,3600)/60
		$Highscore.text="%02d:"%minutes2+"%02d:"%seconds2+"%02d"%msec2
	time+=delta
	msec = fmod(time,1)*100
	seconds= fmod(time,60)
	minutes = fmod(time,3600)/60
	$Minutes.text= "%02d:"%minutes
	$Seconds.text="%02d:"%seconds
	$Msecs.text="%02d"%msec
	
func stop(win)->void:
	if !win:
		set_process(false)
	if win:
		set_process(false)
		Score.check+=1
		if time<Score.highscore:
			Score.highscore=time
			msec2 = fmod(Score.highscore,1)*100
			seconds2= fmod(Score.highscore,60)
			minutes2 = fmod(Score.highscore,3600)/60
			$Highscore.text="%02d:"%minutes2+"%02d:"%seconds2+"%02d"%msec2


