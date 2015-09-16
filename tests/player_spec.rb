require '../lib/player.rb'

describe "Player" do
	it "New" do
		player = Player.new("Pyjac")
		expect(player.name).to eql("Pyjac")
	end

	it "can generate Hash" do
		player = Player.new("Jacob")
		expect(player.to_hash).to eql({"name" => "Jacob" })
		
		player = Player.new("Pyjac")
		player.guess_time = 5555
		player.guesses = 1
		player.guessed_colours_sequence = "RRGR"

		expect(player.to_hash).to eql({"name" => "Pyjac" , "guess_time" => 5555, "guesses" => 1 , "guessed_colours_sequence" => "RRGR"})
	end
end