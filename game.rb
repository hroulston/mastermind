module Numbers_Clues

    def number_colors(numbers)
        {
            "1" => "\e[42m 1 \e[0m",
            "2" => "\e[45m 2 \e[0m",
            "3" => "\e[46m 3 \e[0m",
            "4" => "\e[43m 4 \e[0m",
            "5" => "\e[47m 5 \e[0m",
            "6" => "\e[41m 6 \e[0m"   
        }
        [numbers]
    end

    def clues(guess)
        {
            "right" => "🟣",
            "close" => "⚪️" 
        }
        [guess]
    end
end

class GamePlay

# require Numbers_Clues

    def directions

        important = "\e[31m There can be duplicates. \e[0m"

        puts "Welcome to Mastermind! The computer will create a code of numbers 1-6. Your job will be to guess the order." + important + "You will be allowed 12 guesses. Clues will be given after each attempt. If you guess the right number in the right location you will be given a 🟣. If you guess the right number in the wrong location you will be given a ⚪️. Ready?"
        
        answer = gets.chomp
    end

    
end