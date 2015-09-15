require_relative "extensions/numeric"
class Game

	attr_accessor :level,:player,:game_colours_sequence,:game_colours,:masterminder,:number_of_guesses,:store


	def run
		initialize_game_values
        print_game_level_message
        while (@user_guess_count <= @number_of_guesses)
        	@user_guess = gets.chomp 
          	case @user_guess
	          	when "q",'quit'
	          		break
	          	when "c",'cheat'
	          		puts "CHEAT: %s\n" % game_colours_sequence.join
	          	else
	          		if(@user_guess.length > game_colours_sequence.length)
	          			puts Messages::GAME_LONG_INPUT_MESSAGE % game_colours_sequence.length
	          			next
	          		end
	          		if(@user_guess.length < game_colours_sequence.length)
	          			puts Messages::GAME_SHORT_INPUT_MESSAGE % game_colours_sequence.length
	          			next
	          		end

	          	    masterminder = Masterminder.new(game_colours_sequence, @user_guess.upcase.split(""))

		            unless masterminder.user_won?
			            print_exact_partial_count_message
			            @user_guess_count += 1
		            else
		            	player_guess_time = Time.now - @start_time
		            	game_duration = (player_guess_time).duration

		            	puts Messages::GAME_CONGRAT_MESSAGE

		            	player = get_player
		            	player.guess_time = player_guess_time
		            	player.guesses = @user_guess_count

		            	store.save(@level,player.to_hash)

		            	average_guesses, average_guess_time = store.get_statistics(@level)
		            	puts Messages::GAME_CONGRATULATORY_MESSAGE % 
		            			[player.name, @user_guess.upcase, @user_guess_count, game_duration]
			            
			            top_players = store.get_top_players(@level)

			            puts "=== TOP %s ===" % Constants::TOPS_LIMIT
			            count = 1 
			            top_players.each do |player|
			            	puts "%s. %s solved 'GHHK' in %s guesses over %s" % 
			            			[count,player["name"],player["guesses"],player["guess_time"].duration]
			            	count += 1
			        	end
			            if(play_again?)
			            	initialize_game_values
	        				print_game_level_message
			            else
			            	break
			            end
		            end
          	end
        end
	end

	private 
		attr_accessor :user_guess_count,:user_guess,:start_time

	def initialize_game_values
		@user_guess_count = 1
        @user_guess = ""
        @start_time = Time.now
        @game_colours_sequence = MastermindGenerator::generate(@level)
	end

	def print_exact_partial_count_message
		exact_matches , partial_matches = masterminder.get_matches
		#p game_colours_sequence
		attempts_left = @number_of_guesses - @user_guess_count
		puts Messages::GAME_EXACT_PARTIAL_COUNT_MESSAGE % [exact_matches, partial_matches,@user_guess_count, attempts_left]            
	end
	def get_player
	    puts Messages::GAME_PLAYER_NAME_PROMPT 
	    Player.new(gets.chomp)
  	end 
	def play_again?
		puts Messages::GAME_REPLAY_MESSAGE
		user_input = gets.chomp 
		['p','play'].include?(user_input) ? true : false
	end
	def print_game_level_message
		 puts Messages::GAME_LEVEL_MESSAGE % [Constants::LEVELS[@level],print_generated_sequence]
	end
	def print_generated_sequence
	    output = ""
	    game_colours.each do |key,value|
	      slice_colour = value
	      slice_colour.slice! key
	      output += "(#{key})#{slice_colour},"
	    end
	    return output[0, output.length - 1]
	end
end