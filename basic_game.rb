number_colors = 
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

    important = "\e[31m There can be duplicates. \e[0m"

    puts "Welcome to Mastermind! The computer will create a code of numbers 1-6. Your job will be to guess the order of 4 numbers in order to crack the code." + important + "You will be allowed 12 guesses. Clues will be given after each attempt. If you guess the right number in the right location you will be given a 🟣. If you guess the right number in the wrong location you will be given a ⚪️. Ready?"
    
    gets.chomp
end

answer = directions.downcase

def set_code
    rand_nums = []
    while rand_nums.length < 6
        rand_num = rand(1..6)
        rand_nums.push rand_num
    end
    rand_nums
end

def play_game
    code = set_code
    turns = 1
    while turns <= 12
        puts "Turn # #{turn}: Guess your 4 numbers (1-6)"
        guess = gets.chomp
        color_change = guess.split("").map{ |num| number_colors[num]}
        puts color_change.join(" ")
        turns +=1
    end

end

if answer == "yes"
    play_game
else
    puts "Ok, bye!"
end

