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
    return false unless within_board?(end_pos)
    return false unless destination_clear?(end_pos, board)
    return false unless correct_piece_movement?(end_pos)

    true
  end

  def has_moved?
    @has_moved
  end

  private

  def to_s
    @symbol
  end

  def within_board?(end_pos)
    row, col = end_pos
    row.between?(0, 7) && col.between?(0, 7)
  end

  def destination_clear?(end_pos, board)
    piece_at_end = board.piece_at(end_pos)
    piece_at_end.nil? || piece_at_end.color != @color
  end

  def correct_piece_movement?(end_pos)
    horizontal_move?(end_pos) || vertical_move?(end_pos) || diagonal_move?(end_pos) || knight_move?(end_pos)
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

  def knight_move?(end_pos)
    row_diff = (@position[0] - end_pos[0]).abs
    col_diff = (@position[1] - end_pos[1]).abs

    return true if row_diff == 2 && col_diff == 1
    return true if row_diff == 1 && col_diff == 2

    false
  end

  def horizontal_moves(board)
    moves = []

    (0..7).each do |col|
      next if col == @position[1]

      end_pos = [@position[0], col]
      moves << end_pos if valid_move?(end_pos, board)
    end

    moves
  end

  def vertical_moves(board)
    moves = []

    (0..7).each do |row|
      next if row == @position[0]

      end_pos = [row, @position[1]]
      moves << end_pos if valid_move?(end_pos, board)
    end

    moves
  end

  def diagonal_moves(board)
    moves = []

    (0..7).each do |row|
      (0..7).each do |col|
        next if row == @position[0] && col == @position[1]

        end_pos = [row, col]
        moves << end_pos if valid_move?(end_pos, board)
      end
    end

    moves
  end
end
