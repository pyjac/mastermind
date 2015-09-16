
class MastermindGenerator
	def self.generate(level)
		#game_intermediate_colours = game_beginner_colours.merge({ "L" => "Larender"})
	  sequence = {}
	  case level
	    when Keys::BEGINNER
	      sequence =  get_random_colours(GameColours.beginner_colours, Constants::NUMBER_OF_BEGINNER_CHARACTERS)
	      
	    when Keys::INTERMEDIATE
	      sequence =  get_random_colours(GameColours.intermediate_colour, Constants::NUMBER_OF_INTERMEDIATE_CHARACTERS)
	      
	    when Keys::ADVANCED
	      sequence =  get_random_colours(GameColours.advanced_colours, Constants::NUMBER_OF_ADVANCED_CHARACTERS)
	  end
	  sequence
	end

	private 
	def self.get_random_colours(game_colours, number_of_colours)
    
	    result = []
	    items = game_colours.keys.shuffle
	   
	    number_of_colours.times do |n| 
	      result[n] = items[rand(game_colours.length)]
	    end
	    result
	end

end