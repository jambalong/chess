# frozen_string_literal:true

require_relative '../piece'

# Represents a chess piece of type King.
class King < Piece
  def initialize(color, position)
    super(color, position)
    @symbol = color == :white ? '♔' : '♚'
  end

  def valid_move?(end_pos, board)
    return false unless super
    return false if move_distance_invalid?(end_pos)

    true
  end

  private

  def move_distance_invalid?(end_pos, far_threshold: 1, short_threshold: 1)
    row_diff = (@position[0] - end_pos[0]).abs
    col_diff = (@position[1] - end_pos[1]).abs

    too_far = row_diff > far_threshold || col_diff > far_threshold
    too_short = row_diff < short_threshold && col_diff < short_threshold
    sideways = row_diff > far_threshold && col_diff > far_threshold

    too_far || too_short || sideways
  end
end
