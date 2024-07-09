# frozen_string_literal: true

require_relative 'piece/bishop'
require_relative 'piece/king'
require_relative 'piece/knight'
require_relative 'piece/pawn'
require_relative 'piece/queen'
require_relative 'piece/rook'

# Represents a chess board.
# The Board class is responsible for managing the board state.
# It should store the board state, check for valid moves, and update the board.
class Board
  attr_reader :matrix

  def initialize
    @matrix = Array.new(8) { Array.new(8) }
  end

  def display
    @matrix.reverse.each_with_index do |row, i|
      print "#{8 - i} "
      row.each do |piece|
        print piece.nil? ? ". " : "#{piece} "
      end
      puts
    end
    puts "  a b c d e f g h"
  end

  def move_piece!(start_pos, end_pos)
    piece = piece_at(start_pos)
    return false if piece.nil? || !piece.valid_move?(end_pos, self)

    place_piece!(piece, end_pos)
    remove_piece!(start_pos)
    piece.move_to(end_pos)
    true
  end

  def piece_at(position)
    @matrix[position[0]][position[1]]
  end

  def place_piece!(piece, position)
    @matrix[position[0]][position[1]] = piece
  end

  def remove_piece!(position)
    @matrix[position[0]][position[1]] = nil
  end

  def setup_board
    setup_white_pieces
    setup_black_pieces
  end

  def clear_board!
    @matrix.map! { Array.new(8) }
  end

  private

  def setup_white_pieces
    @matrix[0][0] = Rook.new(:white, [0, 0])
    @matrix[0][1] = Knight.new(:white, [0, 1])
    @matrix[0][2] = Bishop.new(:white, [0, 2])
    @matrix[0][3] = Queen.new(:white, [0, 3])
    @matrix[0][4] = King.new(:white, [0, 4])
    @matrix[0][5] = Bishop.new(:white, [0, 5])
    @matrix[0][6] = Knight.new(:white, [0, 6])
    @matrix[0][7] = Rook.new(:white, [0, 7])
    @matrix[1].map!.with_index { |_, i| Pawn.new(:white, [1, i]) }
  end

  def setup_black_pieces
    @matrix[7][0] = Rook.new(:black, [7, 0])
    @matrix[7][1] = Knight.new(:black, [7, 1])
    @matrix[7][2] = Bishop.new(:black, [7, 2])
    @matrix[7][3] = Queen.new(:black, [7, 3])
    @matrix[7][4] = King.new(:black, [7, 4])
    @matrix[7][5] = Bishop.new(:black, [7, 5])
    @matrix[7][6] = Knight.new(:black, [7, 6])
    @matrix[7][7] = Rook.new(:black, [7, 7])
    @matrix[6].map!.with_index { |_, i| Pawn.new(:black, [6, i]) }
  end
end
