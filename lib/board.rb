require_relative 'string.rb'

class Board
    attr_accessor :code, :decoded, :colors
    
    def initialize()
        @decoded = Array.new
        @colors = ["r", "g", "b", "bl", "c", "y", "m", "w"]
        @code = create_code()
    end 

    def create_code()
        code = Array.new(4)
        for index in 0..code.length - 1
            code[index] = @colors[rand(0..@colors.length() - 1)]
        end
        return code
    end
    
    def try_to_decode(playerChoice)
        playerChoice.each_with_index do |color, index|
            if color == @code[index] && !decoded.include?(index)
                @decoded.push(index)
            end 
        end
    end
end