require_relative 'game.rb'

def play_game()
    game = Game.new()
    game.play()
end

play_game()