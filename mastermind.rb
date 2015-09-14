require_relative "lib/game_colours"

def print_generated_sequence(game_colours_sequence)
    game_beginner_colours = GameColours.beginner_colours
    output = ""
    game_beginner_colours.each do |key,value|
      slice_colour = value
      slice_colour.slice! key
      output += "(#{key})#{slice_colour},"
    end
    puts output[0, output.length - 1]
end


def generate_sequence(level)
  
  #game_intermediate_colours = game_beginner_colours.merge({ "L" => "Larender"})
  sequence = {}
  case level
    when 'b'
      sequence =  get_random_colours(GameColours.beginner_colours, 4)
    when 'i'
      sequence =  get_random_colours(GameColours.intermediate_colour, 6)
    when 'a'
      sequence =  get_random_colours(GameColours.advanced_colours, 8)
  end
  sequence
end

def get_random_colours(game_colours, number_of_colours)
    
    result = []
    items = game_colours.keys.shuffle
   
    number_of_colours.times do |n| 
      result[n] = items[rand(number_of_colours)]
    end
    result
end

def user_won?(computer_generated,user_guess)
  computer_generated.join == user_guess.upcase
end

def get_exact_matches(computer_generated,user_guess) 
  exact_matches = 0
  p_u = []
  p_c = []
  computer_generated.zip(user_guess.upcase.split("")).map do |value|
      if value[0] == value[1]
         exact_matches += 1
      else
          p_c << value[0]
          p_u << value[1]
      end
  end
  [exact_matches, p_c, p_u]
end

def get_partial_matches(partial_computer,partial_user)
  
  partial_computer=partial_computer.reduce(Hash.new(0)) do |memo,ele|
      memo[ele]+=1
     memo
  end
  partial_user=partial_user.reduce(Hash.new(0)) do |memo,ele|
      memo[ele]+=1
    memo
  end
 
  result =0
  partial_user.merge(partial_computer) do |key, oldval, newval| 
      
      if newval >= oldval
          result += oldval
      else
          result +=newval
      end
     
  end
  result
end

# class GameEngine

#   def display_welcome_message
#     puts "Welcome to MASTERMIND"
#     puts "Would you like to #{"(p)lay".colorize(:green)}, read the #{"(i)nstructions".colorize(:blue)}, or #{"(q)uit".colorize(:red)}?"
#     print "> "
#   end

  

# end

# GameEngine.run()


require 'colorize'
require 'json'
user_input = ""
puts "Welcome to MASTERMIND"
puts "Would you like to #{"(p)lay".colorize(:green)}, read the #{"(i)nstructions".colorize(:blue)}, or #{"(q)uit".colorize(:red)}?"
print "> "
while (user_input != "q")
  
  user_input = gets.chomp
  case user_input
    when 'p','play'

        puts "To start the game select a level you would like to play:"
        puts "Enter (b) for Beginner"
        puts "Enter (i) for Intermediate"
        puts "Enter (a) for Advanced"
        user_level = gets.chomp
        number_of_guesses = 12
        case user_level
          when 'b'
            user_guess_count = 1
            game_colours_sequence = generate_sequence('b')
            #game_colours_sequence = ['G','G','Y','B']
            user_guess = ""
            user_guess_count = 1
            puts "I have generated a beginner sequence with four elements made up of: "
            print_generated_sequence(game_colours_sequence)
            puts "Use (q)uit at any time to end the game."
            puts "What's your guess?"
            while (user_guess_count <= number_of_guesses || !user_won?(game_colours_sequence,user_guess))
              
              user_guess = gets.chomp 

              if(!user_won?(game_colours_sequence,user_guess))
                exact_matches = 0; partial_matches = 0;
                #user_guess = user_guess.upcase.split("")
                exact_matches, partial_computer, partial_user = get_exact_matches(game_colours_sequence, user_guess)
                partial_matches = get_partial_matches(partial_computer,partial_user)
                
                puts "You had #{exact_matches} positions exactly matched and #{partial_matches} near match"
                puts "You have tried #{user_guess_count} times. You have #{number_of_guesses - user_guess_count} attempts left."
                puts "Try again: "
                user_guess_count += 1
              else
                puts "Congratulobia You Won"
                break
              end
              
            end
        end
    when 'i','instructions'

    
    when 'q','quit'
      puts "Bye Bye"
      break
  end
end

