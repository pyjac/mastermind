
class GameStore

	def initialize(file)
		@file_path = file

		unless File.exist?(@file_path)
			store = Constants::LEVELS.values.inject(Hash.new([])) do |store, level|
	    				store[level] = []
					    store
					end
			file = File.open(@file_path, "a+")
			file.puts store.to_json
			file.close		
		end
		#@store = JSON.parse(File.read(file)) #open(file, 'a')
	end

	def get_statistics(level)
		
		level = Constants::LEVELS[level]

		store_values = read_store_values
		level_store = store_values[level]

		average_guesses = Constants::TOPS_LIMIT
		average_guess_time = 9999999999999999 #TODO find a better value
		unless level_store.empty?
			average_guesses, average_guess_time = compute_statistics(level_store)
  		end

  		[average_guesses, average_guess_time]
	end

	def save(level, player) 

		level = Constants::LEVELS[level]

		store_values = read_store_values

		#Hack to ensure correct value when top limit is changed
		store_values[level] = store_values[level][0, Constants::TOPS_LIMIT]
		
		if(Constants::TOPS_LIMIT > store_values[level].length)
			store_values[level] << player
			overwrite_to_store(store_values)
		else
			store_values[level] = sort_players_scores(store_values[level])

			#TODO Refactor 
			lasts_player = store_values[level][Constants::TOPS_LIMIT - 1]
			if(lasts_player["guesses"] > player["guesses"] )
				store_values[level][Constants::TOPS_LIMIT - 1] = player
				overwrite_to_store(store_values)
			end

			if(lasts_player["guesses"] == player["guesses"] )
				if(lasts_player["guess_time"] > player["guesses"] )
					store_values[level][Constants::TOPS_LIMIT - 1] = player
					overwrite_to_store(store_values)
				end
			end

		end	
	end

	def get_top_players(level)
		level = Constants::LEVELS[level]
		store_values = read_store_values
		top_players = sort_players_scores(store_values[level])
		top_players
	end
	private
	  attr_accessor :file_path,:store

	def sort_players_scores(players_scores)
		players_scores.sort do |memo, ele|
			    result = 0
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

	def compute_statistics(level_store)
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
	def read_store_values
		file = File.open(@file_path, "r")
		store_values = JSON.parse(file.read)
		file.close
		store_values
	end

	def overwrite_to_store(game_data)
		file = File.open(@file_path, "w")
		file.puts game_data.to_json
		file.close
	end
end
