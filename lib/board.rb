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
  def initialize
    @board = Array.new(8) { Array.new(8) }
    setup_board
  end

  def display
    @board.reverse.each_with_index do |row, i|
      print "#{8 - i} "
      row.each do |piece|
        print piece.nil? ? ". " : "#{piece} "
      end
      puts
    end
    puts "  a b c d e f g h"
  end

  def move_piece!(start_pos, end_pos)
    piece = @board[start_pos[0]][start_pos[1]]
    return false if piece.nil? || !piece.valid_move?(end_pos, @board)

    @board[end_pos[0]][end_pos[1]] = piece
    @board[start_pos[0]][start_pos[1]] = nil
    piece.move_to(end_pos)
    true
  end

  private

  def setup_board
    # Set up white pieces
    @board[0][0] = Rook.new(:white, [0, 0])
    @board[0][1] = Knight.new(:white, [0, 1])
    @board[0][2] = Bishop.new(:white, [0, 2])
    @board[0][3] = Queen.new(:white, [0, 3])
    @board[0][4] = King.new(:white, [0, 4])
    @board[0][5] = Bishop.new(:white, [0, 5])
    @board[0][6] = Knight.new(:white, [0, 6])
    @board[0][7] = Rook.new(:white, [0, 7])
    @board[1].map!.with_index { |_, i| Pawn.new(:white, [1, i]) }

    # Set up black pieces
    @board[7][0] = Rook.new(:black, [7, 0])
    @board[7][1] = Knight.new(:black, [7, 1])
    @board[7][2] = Bishop.new(:black, [7, 2])
    @board[7][3] = Queen.new(:black, [7, 3])
    @board[7][4] = King.new(:black, [7, 4])
    @board[7][5] = Bishop.new(:black, [7, 5])
    @board[7][6] = Knight.new(:black, [7, 6])
    @board[7][7] = Rook.new(:black, [7, 7])
    @board[6].map!.with_index { |_, i| Pawn.new(:black, [6, i]) }
  end
end
