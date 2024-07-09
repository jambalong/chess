# frozen_string_literal: true

# Represents a chess piece.
# The Piece class is responsible for managing the piece state.
# It should store the piece's color, position, and valid moves.
# It should also keep track of whether the piece has moved.
# It should be subclassed for each type of piece (e.g., Pawn, Rook, Knight).
class Piece
  attr_reader :color, :position

  def initialize(color, position)
    @color = color
    @position = position
    @has_moved = false
  end

  def move_to(new_position)
    @position = new_position
    @has_moved = true
  end

  def valid_move?(end_pos, board)
    raise NotImplementedError
  end

  def has_moved?
    @has_moved
  end

  private

  def to_s
    @symbol
  end

  def within_board?(end_pos, board)
    x, y = end_pos
    x.between?(0, board.matrix.size - 1) && y.between?(0, board.matrix.size - 1)
  end

  def same_color_piece?(end_pos, board)
    piece = board.piece_at(end_pos)
    piece&.color == @color
  end

  def horizontal_move?(end_pos)
    @position[0] == end_pos[0]
  end

  def vertical_move?(end_pos)
    @position[1] == end_pos[1]
  end

  def diagonal_move?(end_pos)
    (@position[0] - end_pos[0]).abs == (@position[1] - end_pos[1]).abs
  end
end
