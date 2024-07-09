# frozen_string_literal:true

require_relative '../piece'

# Represents a chess piece of type Knight.
class Knight < Piece
  def initialize(color, position)
    super(color, position)
    @symbol = color == :white ? '♘' : '♞'
  end

  def valid_move?(end_pos, board)
    return false unless l_move?(end_pos)
    return false unless within_board?(end_pos, board)
    return false if same_color_piece?(end_pos, board)

    true
  end

  private

  def l_move?(end_pos)
    x_diff = (@position[0] - end_pos[0]).abs
    y_diff = (@position[1] - end_pos[1]).abs

    return true if x_diff == 2 && y_diff == 1
    return true if x_diff == 1 && y_diff == 2

    false
  end
end
