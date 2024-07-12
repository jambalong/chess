# frozen_string_literal: true

# Represents a chess player.
# The Player class is responsible for managing the player state.
# It should store the player's name and color.
# It should also keep track of the player's captured pieces.
class Player
  attr_reader :name, :color
  attr_accessor :captured_pieces

  def initialize(name, color)
    @name = name
    @color = color
    @captured_pieces = []
  end

  def get_move(board)
    loop do
      puts "#{@name}, enter your move (e.g. 'a2, a4'):"
      move = gets.chomp
      parsed_move = parse_move(move)

      piece = board.piece_at(parse_move(move)[0])
      proper_input = move.match?(/^\s*([a-h][1-8])\s*,\s*([a-h][1-8])\s*$/)
      proper_piece = board.piece_at(parsed_move[0])&.color == @color
      valid_piece_move = piece&.valid_move?(parsed_move[1], board)

      return parsed_move if !move.empty? && proper_input && !piece.nil? && proper_piece && valid_piece_move

      puts 'Invalid move! Please enter a valid move.'
    end
  end

  # 'a2, a4' => [1, 0], [3, 0]
  def parse_move(move)
    move.split(',').map do |coord|
      coord = coord.strip
      [coord[1].to_i - 1, coord[0].ord - 97]
    end
  end
end
