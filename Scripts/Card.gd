class_name Card extends Node2D

@export var suit: Suits
@export var symbol: Symbol
@onready var spriteNode = $Sprite2D
var texture: Texture2D

func _ready() -> void:
	selectSprite()

func selectSprite():
	var spriteFolder
	
	match suit:
		Suits.SPADES:
			spriteFolder = "res://assets/spade/"
		Suits.CLUBS:
			spriteFolder = "res://assets/club/"
		Suits.HEARTS:
			spriteFolder = "res://assets/heart/"
		Suits.DIAMONDS:
			spriteFolder = "res://assets/diamond/"
	
	var spriteSymbol
	match symbol:
		Symbol.ACE:
			spriteSymbol = "card_A.png"
		Symbol.TWO:
			spriteSymbol = "card_2.png"
		Symbol.THREE:
			spriteSymbol = "card_3.png"
		Symbol.FOUR:
			spriteSymbol = "card_4.png"
		Symbol.FIVE:
			spriteSymbol = "card_5.png"
		Symbol.SIX:
			spriteSymbol = "card_6.png"
		Symbol.SEVEN:
			spriteSymbol = "card_7.png"
		Symbol.EIGHT:
			spriteSymbol = "card_8.png"
		Symbol.NINE:
			spriteSymbol = "card_9.png"
		Symbol.TEN:
			spriteSymbol = "card_10.png"
		Symbol.JACK:
			spriteSymbol = "card_J.png"
		Symbol.QUEEN:
			spriteSymbol = "card_Q.png"
		Symbol.KING:
			spriteSymbol = "card_K.png"
	var texturePath = spriteFolder+spriteSymbol
	texture = load(texturePath)
	spriteNode.texture = texture

enum Suits {
	SPADES,
	CLUBS,
	HEARTS,
	DIAMONDS
}

enum Symbol {
	ACE,
	TWO,
	THREE,
	FOUR,
	FIVE,
	SIX,
	SEVEN,
	EIGHT,
	NINE,
	TEN,
	JACK,
	QUEEN,
	KING
}
