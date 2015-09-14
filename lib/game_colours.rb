class GameColours

	attr_accessor :beginner_colours, :intermediate_colours, :advanced_colours

	def self.beginner_colours
		{"R" => "Red"  , "Y" => "Yellow" , "B" => "Blue", "G" => "Green"}
	end

	def self.intermediate_colour
		beginner_colours.merge( { "O" => "Orange" , "W" => "White"})
	end

	def self.advanced_colours
		intermediate_colour
	end
end