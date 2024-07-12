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
    @player_one = Player.new('White', :white)
    @player_two = Player.new('Black', :black)
    @current_player = @player_one
  end

  def play
    # Main game loop
    @board.setup_board
    @board.display

    loop do
      start_pos, end_pos = @current_player.get_move(@board)

      @board.move_piece!(start_pos, end_pos)
      @board.display

      if @board.in_check?(@current_player.color)
        puts "#{@current_player.color} is in check!"
      end

      break if @board.checkmate?(opponent.color)

      switch_current_player
    end

    puts "Game over! #{@current_player.name} wins!"
  end

  private

  def opponent
    @current_player == @player_one ? @player_two : @player_one
  end

  def switch_current_player
    @current_player = @current_player == @player_one ? @player_two : @player_one
  end
end
