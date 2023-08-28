module Numbers_Clues

    def number_colors(numbers)
        {"1" => "\e[42m 1 \e[0m"
         "2" => "\e[45m 2 \e[0m"
         "3" => "\e[46m 3 \e[0m"
         "4" => "\e[43m 4 \e[0m"
         "5" => "\e[47m 5 \e[0m"
         "6" => "\e[41m 6 \e[0m"   
        }
        [numbers]
    end

    def clues(guess)
        {"right" => "🟣"
         "close" => "⚪️" 
        }
        [guess]
    end
end