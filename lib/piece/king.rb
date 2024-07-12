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

  def valid_moves(board)
    moves = []

    (-1..1).each do |row|
      (-1..1).each do |col|
        next if row.zero? && col.zero?

        new_pos = [@position[0] + row, @position[1] + col]
        next unless valid_move?(new_pos, board)

        moves << new_pos
      end
    end

    moves
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
