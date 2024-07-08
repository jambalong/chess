# frozen_string_literal: true

# Represents a chess piece.
# The Piece class is responsible for managing the piece state.
# It should store the piece's color, position, and valid moves.
# It should also keep track of whether the piece has moved.
# It should be subclassed for each type of piece (e.g., Pawn, Rook, Knight).
class Piece
  def initialize(color, position)
    @color = color
    @position = position
    @has_moved = false
  end

  private

  def to_s
    @symbol
  end
end
