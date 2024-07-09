# frozen_string_literal:true

require_relative '../piece'

# Represents a chess piece of type Knight.
class Knight < Piece
  def initialize(color, position)
    super(color, position)
    @symbol = color == :white ? '♘' : '♞'
  end

  def valid_move?(end_pos, board)
    return false unless super

    true
  end
end
