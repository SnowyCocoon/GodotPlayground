extends Node2D

const BattleUnits = preload("res://BattleUnits.tres")

export(int) var hp = 25 setget set_hp
export(int) var damage = 3 

onready var hpLable = $HP_Lable
onready var animPlayer = $AnimationPlayer

signal died
signal end_turn

func set_hp(new_hp):
	hp = new_hp
	if hpLable != null:
		hpLable.text = str(hp) + "hp"

func _ready():
	BattleUnits.Enemy = self
	
func _exit_tree():
	BattleUnits.Enemy = null

func attack() -> void:
	yield(get_tree().create_timer(0.4), "timeout")
	animPlayer.play("Attack")
	yield(animPlayer, "animation_finished")
	emit_signal("end_turn")
	
func deal_damage():
	BattleUnits.PlayerStats.hp -= damage

func take_damage(ammount):
	self.hp -= ammount
	if is_dead():
		emit_signal("died")
		queue_free()
	else:
		animPlayer.play("Shake")
		
func is_dead():
	return hp <=0
