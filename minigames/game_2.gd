extends Panel

@export var phrases: Array[String]
@export var correct_answers: Array[bool]

@onready var phrase = $Label

var ans: Array[bool] = []

func _ready():
	phrase.text = phrases[0]

func _on_seriously_pressed():
	ans.append(1)
	phrase.text = phrases[len(ans)]
	
	if len(ans) == len(correct_answers):
		if check_ans(ans, correct_answers):
			pass
		else:
			pass
	


func _on_sarcasm_pressed():
	ans.append(0)
	phrase.text = phrases[len(ans)]
	
	if len(ans) == len(correct_answers):
		if check_ans(ans, correct_answers):
			pass
		else:
			pass

func check_ans(ans, correct):
	var flag = true
	for i in range(len(ans)):
		flag = flag and (ans[i] == correct[i])
	return flag
