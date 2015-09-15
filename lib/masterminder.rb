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
	  exact_matches = 0
	  p_u = []
	  p_c = []
	  @game_colours_sequence.zip(@user_colours_sequence).map do |value|
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

end