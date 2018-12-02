extends CanvasLayer

func update_time_left(time):
	$TimeLeft.text = str(time).pad_decimals(0)