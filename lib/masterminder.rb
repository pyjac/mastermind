class Masterminder
	attr_accessor :game_colours_sequence,:user_colours_sequence

	def initialize(game_colours_sequence,user_colours_sequence)
		@game_colours_sequence = game_colours_sequence
		@user_colours_sequence = user_colours_sequence
	end

	def user_won?
		@game_colours_sequence == @user_colours_sequence
	end

	def get_matches
		exact_matches = 0; partial_matches = 0;
        exact_matches, partial_computer, partial_user = get_exact_matches()
        partial_matches = get_partial_matches(partial_computer,partial_user)
        [exact_matches, partial_matches]
	end

	private

	def get_exact_matches
	  exact_matches = 0;partial_user = [];partial_computer = []
	  @game_colours_sequence.zip(@user_colours_sequence).map do |value|
	      if value[0] == value[1]
	         exact_matches += 1
	      else
	          partial_computer << value[0]
	          partial_user << value[1]
	      end
	  end
	  [exact_matches, partial_computer, partial_user]
	end

	def get_partial_matches(partial_computer,partial_user)
	  	partial_matches = 0 
		partial_user.each do |value|
		    if(partial_computer.include?(value))
		        partial_computer.delete_at(partial_computer.index(value))
		        partial_matches += 1
		    end
		end
		partial_matches
	end

end