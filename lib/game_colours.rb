class GameColours

	attr_accessor :beginner_colours, :intermediate_colours, :advanced_colours

	def self.beginner_colours
		{"R" => "Red"  , "Y" => "Yellow" , "B" => "Blue", "G" => "Green"}
	end

	def self.intermediate_colour
		beginner_colours.merge( { "O" => "Orange"})
	end

	def self.advanced_colours
		intermediate_colour.merge( {"W" => "White"})
	end

	def self.get_game_colours(level)
		case level
			when Keys::BEGINNER
				return beginner_colours
			when Keys::INTERMEDIATE
				return intermediate_colour
			when Keys::ADVANCED
				return advanced_colours
		end

	end
end