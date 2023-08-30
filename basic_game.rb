$number_colors = 
    {
        "1" => "\e[42m 1 \e[0m",
        "2" => "\e[45m 2 \e[0m",
        "3" => "\e[46m 3 \e[0m",
        "4" => "\e[43m 4 \e[0m",
        "5" => "\e[47m 5 \e[0m",
        "6" => "\e[41m 6 \e[0m"   
    }

def clues(guess)
    {
        "right" => "🟣",
        "close" => "⚪️" 
    }
    [guess]
end

def directions

    important = "\e[31m There can be duplicates! \e[0m"

    puts "Welcome to Mastermind! The computer will create a code of numbers 1-6. Your job will be to guess the order of 4 numbers so you can crack the code." + important + "You will be allowed 12 guesses. Clues will be given after each attempt. If you guess the right number in the right location you will be given a 🟣. If you guess the right number in the wrong location you will be given a ⚪️. Ready?"
    
    gets.chomp
end

answer = directions.downcase

def set_code
    rand_nums = []
    while rand_nums.length < 4
        rand_num = rand(1..6)
        rand_nums.push rand_num
    end
    rand_nums
end

def guess_valid?(guess)
    guess.length == 4
end

def right_nums?(guess)
    guess_array = guess.split("")
    guess_array.all?{|num| /[1-6]/.match(num) }
end

def play_game
    code = set_code
    turns = 1
    while turns <= 12
        puts "Turn ##{turns}: Guess your 4 numbers (1-6)"
        guess = gets.chomp

        if guess_valid?(guess) && right_nums?(guess)
            guess_split = guess.split("")
            int_guess_split = guess_split.map{|num| num.to_i}
            clues = int_guess_split.map{|num| 
                # Make adjustment to logic since purple is not showing
                if code.include?(num) && int_guess_split.index(num) == code.index(num)
                    "🟣"
                elsif code.include?(num)
                    "⚪️"
                end
            }
            # maybe put color change into a method
            color_change = guess_split.map{|num| $number_colors[num]}
            puts color_change.join(" ") + " " + clues.join(" ")
            turns +=1
        else
            # later try to extract the coloring into a def and just pass in the string and extrapolate.
            warning = "\e[31m Please make sure to guess only 4 numbers that are 1-6. \e[0m"
            puts warning
            turns = turns
        end
    end
    
    puts code

end

if answer == "yes"
    play_game
else
    puts "Ok, bye!"
end


