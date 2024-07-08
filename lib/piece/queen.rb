# frozen_string_literal:true

require_relative '../piece'

# Represents a chess piece of type Queen.
class Queen < Piece
  def initialize(color, position)
    super(color, position)
    @symbol = color == :white ? '♕' : '♛'
  end
end