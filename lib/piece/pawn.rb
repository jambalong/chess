# frozen_string_literal:true

require_relative '../piece'

# Represents a chess piece of type Pawn.
class Pawn < Piece
  def initialize(color, position)
    super(color, position)
    @symbol = color == :white ? '♙' : '♟︎'
  end

  def valid_move?(end_pos, board)
    return false if obstructed?(end_pos, board)
    return false unless forward_move?(end_pos) || capture_move?(end_pos)

    true
  end

  private

  def obstructed?(end_pos, board)
    return false if @position[1] == end_pos[1] && forward_one?(end_pos) && board[end_pos[0]][end_pos[1]].nil?
    return false if @position[1] == end_pos[1] && forward_two?(end_pos) && board[end_pos[0]][end_pos[1]].nil?

    return false if capture_move?(end_pos) && !board[end_pos[0]][end_pos[1]].nil?

    true
  end

  def forward_move?(end_pos)
    return true if @position[1] == end_pos[1] && forward_one?(end_pos)
    return true if @position[1] == end_pos[1] && forward_two?(end_pos)

    false
  end

  def forward_one?(end_pos)
    return true if @color == :white && @position[0] + 1 == end_pos[0]
    return true if @color == :black && @position[0] - 1 == end_pos[0]

    false
  end

  def forward_two?(end_pos)
    return true if @color == :white && @position[0] == 1 && @position[0] + 2 == end_pos[0]
    return true if @color == :black && @position[0] == 6 && @position[0] - 2 == end_pos[0]

    false
  end

  def capture_move?(end_pos)
    return true if @color == :white && @position[0] + 1 == end_pos[0] && (@position[1] - 1 == end_pos[1] || @position[1] + 1 == end_pos[1])
    return true if @color == :black && @position[0] - 1 == end_pos[0] && (@position[1] - 1 == end_pos[1] || @position[1] + 1 == end_pos[1])

    false
  end
end
