# frozen_string_literal:true

require_relative '../piece'

# Represents a chess piece of type Pawn.
class Pawn < Piece
  def initialize(color, position)
    super(color, position)
    @symbol = color == :white ? '♙' : '♟︎'
  end
end
