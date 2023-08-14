require_relative 'board.rb'

class Game
    attr_accessor :board

    def initialize()
        @board = Board.new()
    end 
    
    def play()
        intro()
        round = 0

        while true
            if round == 8
                puts "Sorry, game is over. Try again!"
                break
            end

            round += 1
            puts "Round: #{round}"
            puts "There are eight possible colors to choose from:"
            @board.colors.each{|color| paint(color, color)}
            puts " "
            puts "Enter your guess using the appropriate color symbols separated by space:"
            
            playerChoice = getPlayerChoice()
            @board.try_to_decode(playerChoice)
            display(playerChoice)

            if(playerChoice == @board.code)
                puts "You cracked the code! Congratulations!"
                break
            end
        end
    end

    def intro()
        puts "Let's play Mastermind!"
        puts "Your task is to guess the color of the four circles on the decoding board."
        puts "But be careful - each color can appear more than once in a row."
        puts "You have eight attempts to crack the code."
    end

    def getPlayerChoice()
        while true
            playerChoice = gets.chomp
            parsedPC = playerChoice.split(' ')
            falg  = false

            for i in 0..parsedPC.length() - 1
                if !@board.colors.include?(parsedPC[i])
                    puts "Invalid answer. Please try again"
                    flag = false
                    i = parsedPC.length() - 1
                else
                    falg = true
                end
            end

            if falg
                return parsedPC
            end
        end
    end

    def display(playerChoice)
        for i in 0..playerChoice.length() - 1
            if @board.decoded.include?(i)
                paint(playerChoice[i], playerChoice[i])
            else 
                print playerChoice[i]
                print " "
            end
        end
        puts " "
    end

    def paint(str, color)
        case color
        when "bl"
            print "\e[30m#{str}\e[0m"
            print " "
        when "r"
            print "\e[31m#{str}\e[0m"
            print " "
        when "g"
            print "\e[32m#{str}\e[0m"
            print " "
        when "y"
            print "\e[33m#{str}\e[0m"
            print " "
        when "b"
            print "\e[34m#{str}\e[0m"
            print " "
        when "m"  
            print "\e[35m#{str}\e[0m"
            print " "   
        when "c"
            print "\e[36m#{str}\e[0m"
            print " "     
        else
            print "\e[37m#{str}\e[0m" 
            print " "       
        end
    end
end