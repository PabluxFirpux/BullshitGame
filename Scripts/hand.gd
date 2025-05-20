extends Node2D
class_name Hand

const COLLISION_MASK = 1 

var screenSize
var cardBeingDragged
var cardsInHand: Array

func _process(delta: float) -> void:
	dragCards()
	

func dragCards():
	if cardBeingDragged:
		var mouse_pos = get_global_mouse_position()
		cardBeingDragged.position = Vector2(clamp(mouse_pos.x, 0, screenSize.x), clamp(mouse_pos.y, 0, screenSize.y))

func checkForCards():
	var children = get_children()
	for c in children:
		if c.is_class("Card"):
			cardsInHand.append(c)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			var card = checkForCard()
			if card:
				cardBeingDragged = card
		else:
			cardBeingDragged = null

func checkForCard():
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position()
	parameters.collide_with_areas = true
	parameters.collision_mask = COLLISION_MASK
	var result = space_state.intersect_point(parameters)
	if result.size() > 0:
		return result[0].collider.get_parent()
	return null

func _ready() -> void:
	screenSize = get_viewport_rect().size
