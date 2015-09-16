class Player

	attr_accessor :name,:guess_time,:guesses,:guessed_colours_sequence

	def initialize(name)
		@name = name
	end

	def to_hash
	   hash = {}
       instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
 	   hash 
	end

end