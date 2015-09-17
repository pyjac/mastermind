require '../lib/game_colours.rb'
require '../lib/constants.rb'
require '../lib/mastermind_generator.rb'
require '../lib/masterminder.rb'

describe "Masterminder" do
	 before :each do
	    @game_colours_sequence = ['R','G','G','Y','R']
		@user_colours_sequence = ['R','Y','Y','Y','R']
		@masterminder = Masterminder.new(@game_colours_sequence,@user_colours_sequence)
	  end 
	it "can get incorrect guess matches" do
  		exact,partial = @masterminder.get_matches
  		expect(exact).to eql(3)
  		expect(partial).to eql(0)

  		@masterminder = Masterminder.new(['G','G','Y','B'],['G','G','G','R'])

  		exact,partial = @masterminder.get_matches
  		expect(exact).to eql(2)
  		expect(partial).to eql(0)
    end

    it "can detect if player won" do
  		
  		expect(@masterminder.player_won?).to eql(false)

  		@masterminder = Masterminder.new(['G','G','Y','B'],['G','G','G','R'])

  		expect(@masterminder.player_won?).to eql(false)

  		@masterminder = Masterminder.new(['G','G','Y','B'],['G','G','Y','B'])

  		expect(@masterminder.player_won?).to eql(true)
    end
end