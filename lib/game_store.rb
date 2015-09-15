
class GameStore

	def initialize(file)
		@file_path = file
		@store = JSON.parse(File.read(file)) #open(file, 'a')
	end

	def get_statistics(level)
		
		level = Constants::LEVELS[level]

		file = File.open(@file_path, "r")
		store_values = JSON.parse(file.read)

		level_store = store_values[level]
		file.close

		statistics = level_store.reduce(Hash.new(0)) do |memo, player|

	         memo["sum_guess"] += player["guesses"]
	         memo["sum_guess_time"] += player["guess_time"]
	         memo["players_count"] += 1
	         memo
  		end
  		average_guesses = statistics["sum_guess"] / statistics["players_count"]
  		average_guess_time = statistics["sum_guess_time"] / statistics["players_count"]
  		[average_guesses, average_guess_time]
	end

	def save(level, player) 

		level = Constants::LEVELS[level]
		file = File.open(@file_path, "a+")
		store_values = JSON.parse(file.read)
		file.close

		if(Constants::TOPS_LIMIT > store_values[level].length)
			store_values[level] << player
		else
			store_values[level] = sort_players_scores(store_values[level])

			#TODO Refactor 
			lasts_player = store_values[level][Constants::TOPS_LIMIT - 1]
			if(lasts_player["guesses"] > player["guesses"] )
				store_values[level][Constants::TOPS_LIMIT - 1] = player
				file = File.open(@file_path, "w")
				file.puts store_values.to_json
				file.close
			end
		end

		
	end

	def get_top_players(level)
		level = Constants::LEVELS[level]

		file = File.open(@file_path, "r")
		store_values = JSON.parse(file.read)

		top_players = store_values[level].sort_by! { |hsh| hsh["guesses"]  }

		file.close
		top_players
	end
	private
	  attr_accessor :file_path,:store

	def sort_players_scores(players_scores)
		players_scores.sort do |memo, ele|
			    result= 0
			    if memo["guesses"] > ele["guesses"]
			        result = 1
			    end
			    if memo["guesses"] < ele["guesses"]
			        result = -1
			    end
			    
			    if memo["guesses"] == ele["guesses"]
			        memo["guess_time"] <=  ele["guess_time"] ? result=-1 : result=1
			    end
			    result
			   
			end
	end
end
