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

  def valid_moves(board)
    moves = []

    [-2, -1, 1, 2].each do |row_diff|
      [-2, -1, 1, 2].each do |col_diff|
        next if row_diff.abs == col_diff.abs
        next if row_diff.zero? || col_diff.zero?

        end_pos = [@position[0] + row_diff, @position[1] + col_diff]
        moves << end_pos if valid_move?(end_pos, board)
      end
    end

    moves
  end
end
