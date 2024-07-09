# frozen_string_literal:true

require_relative '../piece'

# Represents a chess piece of type Bishop.
class Bishop < Piece
  def initialize(color, position)
    super(color, position)
    @symbol = color == :white ? '♗' : '♝'
  end

  def valid_move?(end_pos, board)
    return false unless super
    return false if obstructed_in_diagonal?(end_pos, board)

    true
  end

  private

  def obstructed_in_diagonal?(end_pos, board)
    row_diff = end_pos[0] - @position[0]
    col_diff = end_pos[1] - @position[1]
    row_dir = row_diff.positive? ? 1 : -1
    col_dir = col_diff.positive? ? 1 : -1

    row = @position[0] + row_dir
    col = @position[1] + col_dir

    while row != end_pos[0] && col != end_pos[1]
      return true if board.piece_at([row, col])

      row += row_dir
      col += col_dir
    end

    false
  end
end
