# frozen_string_literal:true

require_relative '../piece'

# Represents a chess piece of type Rook.
class Rook < Piece
  def initialize(color, position)
    super(color, position)
    @symbol = color == :white ? '♖' : '♜'
  end

  def valid_move?(end_pos, board)
    return false unless super
    return false if obstructed?(end_pos, board)

    true
  end

  private

  def obstructed?(end_pos, board)
    if same_row?(end_pos)
      obstructed_in_row?(end_pos, board)
    elsif same_column?(end_pos)
      obstructed_in_column?(end_pos, board)
    else
      false
    end
  end

  def same_row?(end_pos)
    @position[0] == end_pos[0]
  end

  def same_column?(end_pos)
    @position[1] == end_pos[1]
  end

  def obstructed_in_row?(end_pos, board)
    start_col, end_col = [@position[1], end_pos[1]].sort
    (start_col + 1...end_col).each do |col|
      return true if board.piece_at([@position[0], col])
    end
    false
  end

  def obstructed_in_column?(end_pos, board)
    start_row, end_row = [@position[0], end_pos[0]].sort
    (start_row + 1...end_row).each do |row|
      return true if board.piece_at([row, @position[1]])
    end
    false
  end
end
