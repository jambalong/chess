# frozen_string_literal: true

# Represents a chess player.
# The Player class is responsible for managing the player state.
# It should store the player's name and color.
# It should also keep track of the player's captured pieces.
class Player
  def initialize(name, color)
    @name = name
    @color = color
    @captured_pieces = []
  end
end
