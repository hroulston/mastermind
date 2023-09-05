$number_colors = 
    {
        "1" => "\e[42m 1 \e[0m",
        "2" => "\e[45m 2 \e[0m",
        "3" => "\e[46m 3 \e[0m",
        "4" => "\e[43m 4 \e[0m",
        "5" => "\e[47m 5 \e[0m",
        "6" => "\e[41m 6 \e[0m"   
    }
    def important (string)
        "\e[31m #{string} \e[0m"
    end
def directions

    puts "Welcome to Mastermind! \n\nHow to play: \n* The computer will create a code of numbers 1-6. \n*Your job will be to guess the order of 4 numbers so you can crack the code.\n" + important("There can be duplicates!") + "\n*You will be allowed 12 guesses. \n*Clues will be given after each attempt. \n*If you guess the right number in the right location you will be given a 🟣. \n*If you guess the right number in the wrong location you will be given a ⚪️. \nReady?"
    
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

def right(temp_code, temp_guess) 
    temp_guess.each_with_index do |num, indx|
      next unless num == temp_code[indx]
         temp_code[indx] = "🟣"
         temp_guess[indx] = "🟣"
    end
end

def close(temp_code, temp_guess)
    temp_guess.each_with_index do |num, indx|
        next unless num != "🟣" && temp_code.include?(temp_guess[indx])
        code_indx = temp_code.find_index(temp_guess[indx])
        temp_code[code_indx] = "⚪️"
        temp_guess[indx] = "⚪️"
    end
end

def wrong(temp_guess)
    temp_guess.each_with_index do |num, indx|
        temp_guess[indx].class == Integer ? temp_guess[indx] = "○" : num
        temp_guess.shuffle()
    end
end

def solved?(guess, code)
    guess == code
end

def color_change(arr)
    arr.map{|num| $number_colors[num]}
end

def play_game
    code = set_code
    turns = 1
    while turns <= 12
        puts "Turn ##{turns}: Guess your 4 numbers (1-6)"
        guess = gets.chomp

        if guess_valid?(guess) && right_nums?(guess)
            # splits guess into array
            guess_split = guess.split("")
            # turns guess into integers
            int_guess_split = guess_split.map{|num| num.to_i}
            guess_temp = int_guess_split.clone
            code_temp = code.clone
            if solved?(int_guess_split, code)
                puts "Great job! You guessed the code!"
                break
            elsif 
                right(code_temp, guess_temp)
                close(code_temp, guess_temp)
                clues = wrong(guess_temp).shuffle()
            end

            # maybe put color change into a method
            color_change = color_change(guess_split)
            puts color_change.join(" ") + " " + clues.join(" ")
            turns +=1
        else
            # later try to extract the coloring into a def and just pass in the string and extrapolate.
            warning = important("Please make sure to guess only 4 numbers that are 1-6.")
            puts warning
            turns = turns
        end
    end
    
    code_string = code.map{|num| num.to_s}
    puts "\n\ncode: #{color_change(code_string).join(" ")}"

end

if answer == "yes"
    play_game
else
    puts "Ok, bye!"
end


