# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# Represents a game of chess.
# The Game class is responsible for managing the game state.
# It should store the board, players, and current player.
# It should also handle input and output.
class Game
  def initialize
    @board = Board.new
    @player_one = Player.new('Player 1', :white)
    @player_two = Player.new('Player 2', :black)
    @current_player = @player_one
  end

  def play
    # Main game loop
    @board.display
  end
end
